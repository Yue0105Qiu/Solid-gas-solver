/*---------------------------------------------------------------------------*\
  =========                 |
  \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox
   \\    /   O peration     | Website:  https://openfoam.org
    \\  /    A nd           | Copyright (C) 2013-2018 OpenFOAM Foundation
     \\/     M anipulation  |
-------------------------------------------------------------------------------
License
    This file is part of OpenFOAM.

    OpenFOAM is free software: you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    OpenFOAM is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
    FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
    for more details.

    You should have received a copy of the GNU General Public License
    along with OpenFOAM.  If not, see <http://www.gnu.org/licenses/>.

\*---------------------------------------------------------------------------*/

#include "pyrolysisChemistryModel.H"
#include "SolidReaction.H"
#include "basicThermo.H"

// * * * * * * * * * * * * * * * * Constructors  * * * * * * * * * * * * * * //

template<class CompType, class SolidThermo, class GasThermo>
Foam::pyrolysisChemistryModel<CompType, SolidThermo, GasThermo>::
pyrolysisChemistryModel
(
    typename CompType::reactionThermo& thermo
)
:
    solidChemistryModel<CompType, SolidThermo>(thermo),
    pyrolisisGases_
    (
        dynamic_cast<const SolidReaction<SolidThermo>&>
        (
            this->reactions_[0]
        ).gasSpecies()
    ),
    gasThermo_(pyrolisisGases_.size()),
    nGases_(pyrolisisGases_.size()),
    nSpecie_(this->Ys_.size() + nGases_),
    gasIndexList_(labelField(nGases_, -1)),
    RRg_(nGases_),
    useHOR_(false),
    constantHOR_(false),
    HOR_(this->reactions_.size(), 0.0),
    myFinalQdot_
    (
		IOobject
		(
            "myFinalQdot_",
            this->mesh().time().timeName(),
            this->mesh(),
            IOobject::NO_READ,
            IOobject::NO_WRITE
        ),
        this->mesh(),
        dimensionedScalar("zero", dimEnergy/dimTime/dimVolume, 0.0)
    ),
    Ys0_(this->nSolids_),
    cellCounter_(0)
{
	Info<< "@Mor pyrolysisChemistryModel constructor" << endl;
    // create the fields for the chemistry sources
    forAll(this->RRs_, fieldi)
    {
        IOobject header
        (
            this->Ys_[fieldi].name() + "0",
            this->mesh().time().timeName(),
            this->mesh(),
            IOobject::NO_READ
        );

        // check if field exists and can be read
        if (header.typeHeaderOk<volScalarField>(true))
        {
            Ys0_.set
            (
                fieldi,
                new volScalarField
                (
                    IOobject
                    (
                        this->Ys_[fieldi].name() + "0",
                        this->mesh().time().timeName(),
                        this->mesh(),
                        IOobject::MUST_READ,
                        IOobject::AUTO_WRITE
                    ),
                    this->mesh()
                )
            );
        }
        else
        {
            volScalarField Y0Default
            (
                IOobject
                (
                    "Y0Default",
                    this->mesh().time().timeName(),
                    this->mesh(),
                    IOobject::MUST_READ,
                    IOobject::NO_WRITE
                ),
                this->mesh()
            );

            Ys0_.set
            (
                fieldi,
                new volScalarField
                (
                    IOobject
                    (
                        this->Ys_[fieldi].name() + "0",
                        this->mesh().time().timeName(),
                        this->mesh(),
                        IOobject::NO_READ,
                        IOobject::AUTO_WRITE
                    ),
                    Y0Default
                )
            );

            // Calculate initial values of Ysi0 = rho*delta*Yi
            Ys0_[fieldi].primitiveFieldRef() =
                this->solidThermo().rho()
               *max(this->Ys_[fieldi], scalar(0.001))*this->mesh().V();
        }
    }

    forAll(RRg_, fieldi)
    {
        RRg_.set
        (
            fieldi,
            new volScalarField::Internal
            (
                IOobject
                (
                    "RRg." + pyrolisisGases_[fieldi],
                    this->mesh().time().timeName(),
                    this->mesh(),
                    IOobject::NO_READ,
                    IOobject::NO_WRITE
                ),
                this->mesh(),
                dimensionedScalar("zero", dimMass/dimVolume/dimTime, 0.0)
            )
        );
    }

    forAll(gasThermo_, gasI)
    {
        dictionary thermoDict =
            this->mesh().template lookupObject<dictionary>
            (
                //basicThermo::dictName
                thermo.phasePropertyName("thermophysicalProperties")
            ).subDict(pyrolisisGases_[gasI]);

        gasThermo_.set
        (
            gasI,
            new GasThermo(thermoDict)
        );
    }

    Info<< "pyrolysisChemistryModel: " << nl;
    Info<< indent << "Number of solids = " << this->nSolids_ << nl;
    Info<< indent << "Number of gases = " << nGases_ << nl;
    forAll(this->reactions_, i)
    {
        Info<< dynamic_cast<const SolidReaction<SolidThermo>&>
        (
            this->reactions_[i]
        ) << nl;
    }
    
    // Morteza: added the below part to use simple Heat of Reaction
    IOobject header
    (
        "simpleHeatOfReaction",
        this->mesh().time().constant(),
        this->mesh(),
        IOobject::NO_READ
    );

	// check if field exists and can be read
    if (header.typeHeaderOk<IOdictionary>(true))
    {
        Info<<"Found simpleHeatOfReaction dictionary. "
			<<"The hf of species will not be used!"<<endl;
        useHOR_ = true;
        
        IOdictionary simpleHORDict
		(
			IOobject
			(
				"simpleHeatOfReaction",
				this->mesh().time().constant(),
				this->mesh(),
				IOobject::MUST_READ_IF_MODIFIED,
				IOobject::NO_WRITE
			)
		);
		
		simpleHORDict.lookup("constantHOR") >> constantHOR_;
		Info<<"Constant Heat of Reaction is "<<constantHOR_<<endl;
		
		
		simpleHORDict.lookup("heatOfReaction") >> HOR_;
		if (HOR_.size() != this->reactions_.size())
		{
			FatalErrorInFunction
				<< "The number of heat of reactions, "<<HOR_.size()
				<< ", is not equal to the number of reactions, "
				<< this->reactions_.size()<<"!"
				<< exit(FatalError);
		}
		
		Info<<"The heat of reactions from dictionary are:\n"<<HOR_<<endl;
    }
    else
    {
		Info<<"Cannot find simpleHeatOfReaction! "
			<<"Using hf of species to calculate heat of reaction."<<endl;
	}
}


// * * * * * * * * * * * * * * * * Destructor  * * * * * * * * * * * * * * * //

template<class CompType, class SolidThermo, class GasThermo>
Foam::pyrolysisChemistryModel<CompType, SolidThermo, GasThermo>::
~pyrolysisChemistryModel()
{}


// * * * * * * * * * * * * * * * Member Functions  * * * * * * * * * * * * * //

template<class CompType, class SolidThermo, class GasThermo>
Foam::scalarField Foam::
pyrolysisChemistryModel<CompType, SolidThermo, GasThermo>::omega
(
    const scalarField& c,
    const scalar T,
    const scalar p,
    const bool updateC0
) const
{
    scalar pf, cf, pr, cr;
    label lRef, rRef;
            
    const label celli = cellCounter_;

    scalarField om(nEqns(), 0.0);

    forAll(this->reactions_, i)
    {
        const SolidReaction<SolidThermo>& R =
            dynamic_cast<const SolidReaction<SolidThermo>&>
            (
                this->reactions_[i]
            );
        scalar omegai = omega
        (
            R, c, T, p, pf, cf, lRef, pr, cr, rRef
        );
        
        
        // Morteza: To fix the omegai with gas spec concentrations
              
        forAll(R.glhs(), g)
		{
			label gi = R.glhs()[g].index;
			const scalar exp = R.glhs()[g].exponent;
			omegai *= pow(c[gi + this->nSolids_], exp);
		}
		
		// Morteza: To correct the omega if one species is depleting
        forAll(R.glhs(), g)
		{
			label gi = R.glhs()[g].index;
			if (R.glhs()[g].stoichCoeff*omegai > c[gi + this->nSolids_])
			{
				omegai = c[gi + this->nSolids_] / R.glhs()[g].stoichCoeff;
			}
		}
		forAll(R.lhs(), s)
        {
            label si = R.lhs()[s].index;
            if (R.lhs()[s].stoichCoeff*omegai > c[si])
            {
				omegai = c[si] / R.lhs()[s].stoichCoeff;
			}
        }
		
        
        // original calculations
        forAll(R.lhs(), s)
        {
            label si = R.lhs()[s].index;
            om[si] -= R.lhs()[s].stoichCoeff * omegai;
            
            if (updateC0)
            {
                Ys0_[si][celli] -= R.lhs()[s].stoichCoeff*omegai;
            }
        }
        
        forAll(R.rhs(), s)
        {
            label si = R.rhs()[s].index;
            om[si] += R.rhs()[s].stoichCoeff*omegai;

            if (updateC0)
            {
                Ys0_[si][celli] += R.rhs()[s].stoichCoeff*omegai;
            }
        }
        
        // Morteza: Added to include glhs
        forAll(R.glhs(), g)
        {
            label gi = R.glhs()[g].index;
            om[gi + this->nSolids_] -= R.glhs()[g].stoichCoeff*omegai;
        }
        
        forAll(R.grhs(), g)
        {
            label gi = R.grhs()[g].index;
            om[gi + this->nSolids_] += R.grhs()[g].stoichCoeff*omegai;
        }
    }
    
	/*if (celli == 0)
	{
		Info<<"species omega:"<<endl;
		forAll(om, i)
		{
			Info<< i << " : " << om[i] << endl;
		}
	}*/
	
    return om;
}

//----------------------------------------------------------------------
template<class CompType, class SolidThermo, class GasThermo>
Foam::scalarField Foam::
pyrolysisChemistryModel<CompType, SolidThermo, GasThermo>::myOmega
(
    const scalarField& c,
    const scalar T,
    const scalar p,
    const bool updateC0
)
{
    scalar pf, cf, pr, cr;
    label lRef, rRef;
            
    const label celli = cellCounter_;

    scalarField om(nEqns(), 0.0);

    forAll(this->reactions_, i)
    {
        const SolidReaction<SolidThermo>& R =
            dynamic_cast<const SolidReaction<SolidThermo>&>
            (
                this->reactions_[i]
            );
        scalar omegai = omega
        (
            R, c, T, p, pf, cf, lRef, pr, cr, rRef
        );
        
        // Morteza: To fix the omegai with gas spec concentrations
        forAll(R.glhs(), g)
		{
			label gi = R.glhs()[g].index;
			const scalar exp = R.glhs()[g].exponent;
			omegai *= pow(c[gi + this->nSolids_], exp);
		}
		
		// Morteza: To correct the omega if one species is depleting
        forAll(R.glhs(), g)
		{
			label gi = R.glhs()[g].index;
			if (R.glhs()[g].stoichCoeff*omegai > c[gi + this->nSolids_])
			{
				omegai = c[gi + this->nSolids_] / R.glhs()[g].stoichCoeff;
			}
		}
		forAll(R.lhs(), s)
        {
            label si = R.lhs()[s].index;
            if (R.lhs()[s].stoichCoeff*omegai > c[si])
            {
				omegai = c[si] / R.lhs()[s].stoichCoeff;
			}
        }
		
		if (useHOR_)
		{
			myFinalQdot_[celli] -= omegai * HOR_[i];
		}	
        
        forAll(R.lhs(), s)
        {
            label si = R.lhs()[s].index;
            om[si] -= R.lhs()[s].stoichCoeff * omegai;
            
            if (updateC0)
            {
                Ys0_[si][celli] -= R.lhs()[s].stoichCoeff*omegai;
            }
        }
        
        forAll(R.rhs(), s)
        {
            label si = R.rhs()[s].index;
            om[si] += R.rhs()[s].stoichCoeff*omegai;

            if (updateC0)
            {
                Ys0_[si][celli] += R.rhs()[s].stoichCoeff*omegai;
            }
        }
        
        // Morteza: Added to include glhs
        forAll(R.glhs(), g)
        {
            label gi = R.glhs()[g].index;
            om[gi + this->nSolids_] -= R.glhs()[g].stoichCoeff*omegai;
        }
        
        forAll(R.grhs(), g)
        {
            label gi = R.grhs()[g].index;
            om[gi + this->nSolids_] += R.grhs()[g].stoichCoeff*omegai;
        }
    }
	
    return om;
}
//----------------------------------------------------------------------


template<class CompType, class SolidThermo, class GasThermo>
Foam::scalar
Foam::pyrolysisChemistryModel<CompType, SolidThermo, GasThermo>::omega
(
    const Reaction<SolidThermo>& R,
    const scalarField& c,
    const scalar T,
    const scalar p,
    scalar& pf,
    scalar& cf,
    label& lRef,
    scalar& pr,
    scalar& cr,
    label& rRef
) const
{
    scalarField c1(nSpecie_, 0.0);
    
    //label celli = cellCounter_;
	
    for (label i=0; i<nSpecie_; i++)
    {
        c1[i] = max(0.0, c[i]);
    }

    scalar kf = R.kf(p, T, c1);

    //const label Nl = R.lhs().size();

	// Old kf calculations, only solid lhs
    /*for (label s=0; s<Nl; s++)
    {
        label si = R.lhs()[s].index;
        const scalar exp = R.lhs()[s].exponent;
        
        kf *=
            pow(c1[si]/Ys0_[si][celli], exp)
           *(Ys0_[si][celli]);
    }*/
    
    forAll(R.lhs(), s)
    {
		label si = R.lhs()[s].index;
		const scalar exp = R.lhs()[s].exponent;
		kf *= pow(c1[si], exp);
	}

    // Added by Yue on 20250522: to let the kf = 0 when it is very small
    /* Info << "kf before check = " << kf << endl;
    if (kf < 1.0e-20)
    {
        kf = 0.0;
    }
    Info << "kf after check = " << kf << endl;*/
    // Finished by Yue on 20250522.
	/*forAll(R.glhs(), g)
	{
		label gi = R.glhs()[g].index;
		const scalar exp = R.glhs()[g].exponent;
		kf *= pow(c1[gi + this->nSolids_], exp);
	}*/
	
	// Morteza: To fix the omegai with Sa for char reactions
	if (R.type() == "irreversiblemorArrheniusSolidReaction")
	{
		scalar Sa = c[nSpecie_];
		//Info<<"before: "<<kf<<", ";
		kf *= Sa;
		//Info<<" , after: "<<kf<<", "<<endl;
	}

    return kf;
}


template<class CompType, class SolidThermo, class GasThermo>
Foam::scalar Foam::pyrolysisChemistryModel<CompType, SolidThermo, GasThermo>::
omegaI
(
    const label index,
    const scalarField& c,
    const scalar T,
    const scalar p,
    scalar& pf,
    scalar& cf,
    label& lRef,
    scalar& pr,
    scalar& cr,
    label& rRef
) const
{

    const Reaction<SolidThermo>& R = this->reactions_[index];
    scalar w = omega(R, c, T, p, pf, cf, lRef, pr, cr, rRef);
    return(w);
}


template<class CompType, class SolidThermo, class GasThermo>
void Foam::pyrolysisChemistryModel<CompType, SolidThermo, GasThermo>::
derivatives
(
    const scalar time,
    const scalarField &c,
    scalarField& dcdt
) const
{
    const scalar T = c[nSpecie_];
    const scalar p = c[nSpecie_ + 1];

    dcdt = 0.0;

    dcdt = omega(c, T, p);

    // Total mass concentration
    scalar cTot = 0.0;
    for (label i=0; i<this->nSolids_; i++)
    {
        cTot += c[i];
    }

    scalar newCp = 0.0;
    scalar newhi = 0.0;
    for (label i=0; i<this->nSolids_; i++)
    {
        scalar dYidt = dcdt[i]/cTot;
        scalar Yi = c[i]/cTot;
        newCp += Yi*this->solidThermo_[i].Cp(p, T);
        newhi -= dYidt*this->solidThermo_[i].Hc();
    }

    scalar dTdt = newhi/newCp;
    scalar dtMag = min(500.0, mag(dTdt));
    dcdt[nSpecie_] = dTdt*dtMag/(mag(dTdt) + 1.0e-10);

    // dp/dt = ...
    dcdt[nSpecie_ + 1] = 0.0;
}


template<class CompType, class SolidThermo, class GasThermo>
void Foam::pyrolysisChemistryModel<CompType, SolidThermo, GasThermo>::
jacobian
(
    const scalar t,
    const scalarField& c,
    scalarField& dcdt,
    scalarSquareMatrix& dfdc
) const
{
    const scalar T = c[nSpecie_];
    const scalar p = c[nSpecie_ + 1];

    scalarField c2(nSpecie_, 0.0);

    for (label i=0; i<this->nSolids_; i++)
    {
        c2[i] = max(c[i], 0.0);
    }

    for (label i=0; i<nEqns(); i++)
    {
        for (label j=0; j<nEqns(); j++)
        {
            dfdc(i, j) = 0.0;
        }
    }

    // length of the first argument must be nSolids
    dcdt = omega(c2, T, p);

    for (label ri=0; ri<this->reactions_.size(); ri++)
    {
        const Reaction<SolidThermo>& R = this->reactions_[ri];

        scalar kf0 = R.kf(p, T, c2);

        forAll(R.lhs(), j)
        {
            label sj = R.lhs()[j].index;
            scalar kf = kf0;
            forAll(R.lhs(), i)
            {
                label si = R.lhs()[i].index;
                scalar exp = R.lhs()[i].exponent;
                if (i == j)
                {
                    if (exp < 1.0)
                    {
                        if (c2[si] > small)
                        {
                            kf *= exp*pow(c2[si], exp - 1.0);
                        }
                        else
                        {
                            kf = 0.0;
                        }
                    }
                    else
                    {
                        kf *= exp*pow(c2[si], exp - 1.0);
                    }
                }
                else
                {
                    Info<< "Solid reactions have only elements on slhs"
                        << endl;
                    kf = 0.0;
                }
            }

            forAll(R.lhs(), i)
            {
                label si = R.lhs()[i].index;
                dfdc[si][sj] -= kf;
            }
            forAll(R.rhs(), i)
            {
                label si = R.rhs()[i].index;
                dfdc[si][sj] += kf;
            }
        }
    }

    // calculate the dcdT elements numerically
    scalar delta = 1.0e-8;
    scalarField dcdT0 = omega(c2, T - delta, p);
    scalarField dcdT1 = omega(c2, T + delta, p);

    for (label i=0; i<nEqns(); i++)
    {
        dfdc[i][nSpecie_] = 0.5*(dcdT1[i] - dcdT0[i])/delta;
    }

}


template<class CompType, class SolidThermo, class GasThermo>
Foam::label Foam::
pyrolysisChemistryModel<CompType, SolidThermo, GasThermo>::nEqns() const
{
    // nEqns = number of solids + gases + temperature + pressure
    return (nSpecie_ + 2);
}


template<class CompType, class SolidThermo, class GasThermo>
void Foam::pyrolysisChemistryModel<CompType, SolidThermo, GasThermo>::
calculate()
{
	Info<<"@MOR pyrolysisChemistryModel.C @ line 463 - chemistry->calculate() function"
		<< endl;
	
	
    if (!this->chemistry_)
    {
        return;
    }
    
    // ---------- To get gas thermo data
    psiReactionThermo& realGasThermo = this->realGasThermo();
	basicSpecieMixture& gComp = realGasThermo.composition();
	PtrList<volScalarField>& Yg = gComp.Y();
	const volScalarField rhogCopy = realGasThermo.rho();
	
	// ---------- To get Sa field
	const fvMesh& mesh_ = this->mesh();

    // ---------- Modified by Yue ---------- //
    autoPtr<volScalarField> SaPtr; 
    if (mesh_.foundObject<volScalarField>("Sa"))
    {
        SaPtr.reset
        (
            const_cast<volScalarField*>(
                &mesh_.lookupObject<volScalarField>("Sa")
            ) // false → don’t delete when SaPtr goes out of scope            
        );
    }
    else
    {
        
        SaPtr.reset
        (
            new volScalarField
            (
                IOobject
                (
                    "Sa",
                    mesh_.time().timeName(),
                    mesh_,
                    IOobject::NO_READ,
                    IOobject::NO_WRITE
                ),
                mesh_,
                dimensionedScalar("one", dimless, 1.0)
            )
        );
        Info<< "Sa not found; using default value 1" << endl;
    }
    
    // Bind a reference for convenience
    const volScalarField& Sa = SaPtr();

    // const volScalarField& Sa = mesh_.lookupObject<volScalarField>("Sa");
    // ---------- Modified by Yue ---------- //

    //labelField gasIndexList_(nGases_, -1);
	//Info<<"rhog min max:"<<gMin(rhogCopy)<<", "<<gMax(rhogCopy)<<endl;
	//Info<<"rhog: "<<rhog<<endl;
	//Info<<"min/max rhog: "<<gMin(rhog)<<", "<<gMax(rhog)<<endl;
	
	forAll(gasIndexList_, i)
	{
		label index = -1;
		forAll (Yg, j)
		{
			if (gasThermo_[i].name()+".gas" == Yg[j].name() ||
                gasThermo_[i].name() == Yg[j].name()) 
			{
				index = j;
				// Info<<i<<", "<<j<<", "<<gasThermo_[i].name()<<" min/max: "
					// <<gMin(Yg[j])<<", "<<gMax(Yg[j])<<endl;
			}
		}
		gasIndexList_[i] = index;	// -1 or gas phase real index
	}	
	// ----------

    const volScalarField rho
    (
        IOobject
        (
            "rho",
            this->time().timeName(),
            this->mesh(),
            IOobject::NO_READ,
            IOobject::NO_WRITE,
            false
        ),
        this->solidThermo().rho()
    );
    
    //  simpleHOR: QDot = sum(hs*omega) + HOR, hs : sensible enthalpy
    // !simpleHOR: QDot = sum(ha*omega) , ha=hs+hf : absolute enthalpy
    // constantHOR: QDot = HOR
    myFinalQdot_ = myFinalQdot_ * 0.0;
    
    forAll(this->RRs_, i)
    {
        this->RRs_[i].field() = 0.0;
    }

    forAll(RRg_, i)
    {
        RRg_[i].field() = 0.0;
    }
    
    forAll(rho, celli)
    {
        cellCounter_ = celli;
        

        const scalar delta = this->mesh().V()[celli];

        if (this->reactingCells_[celli])
        {
            scalar rhoi = rho[celli];
            scalar Ti = this->solidThermo().T()[celli];
            scalar pi = this->solidThermo().p()[celli];
            scalar Sai = Sa[celli];
            
            // Info<<"rhoi = "<< rhoi<<endl;
            // Info<<"rhogCopy[celli] = "<< rhogCopy[celli]<<endl;
			// Info<<"Ti = "<< Ti<<endl;
			// Info<<"pi = "<< pi<<endl;


            scalarField c(nSpecie_+1, 0.0); // +1 is for Sai
            for (label i=0; i<this->nSolids_; i++)
            {
                c[i] = rhoi*this->Ys_[i][celli]*delta;
            }
            // fixed to have gas mass as well!
            for (label i=0; i < nGases_; i++)
            {
				label index = gasIndexList_[i];
				if (index > -1)
				{
					c[i + this->nSolids_] = rhogCopy[celli]*Yg[index][celli]; //*delta;
				}
            }
            c[nSpecie_] = Sai;
            
            
            // changed to add simple HOR
            
            //const scalarField dcdt = omega(c, Ti, pi, true);
			scalarField dcdt(nEqns(), 0.0);
			if (useHOR_)
			{
				dcdt = myOmega(c, Ti, pi, true); // it also updates myFinalQdot_
				myFinalQdot_[celli] /= delta;
			}
			else
			{
				dcdt = omega(c, Ti, pi, true); // it does not update myFinalQdot_
			}

            forAll(this->RRs_, i)
            {
                this->RRs_[i][celli] = dcdt[i]/delta;
                //update Qdot
                if (!constantHOR_)
                {
					scalar hf = 0; 
					if (useHOR_)
					{
						hf = this->solidThermo_[i].Hs(pi, Ti);
					}
					else
					{
						hf = this->solidThermo_[i].Ha(pi, Ti);
                        // Info << "RRs[i]" << this->RRs_[i][celli] <<  " h[i] " << hf << endl;
					}
					myFinalQdot_[celli] -= this->RRs_[i][celli] * hf;
				}
            }
            

            forAll(RRg_, i)
            {
				RRg_[i][celli] = dcdt[this->nSolids_ + i]/delta;
				//update Qdot
                scalar hf = 0; 
                if (!constantHOR_)
                {
					if (useHOR_)
					{
						hf = gasThermo_[i].Hs(pi, Ti);
					}
					else
					{
						hf = gasThermo_[i].Ha(pi, Ti);
                        // Info << "RRg[i]" << this->RRg_[i][celli] <<  " h[i] " << hf << endl;
					}
					myFinalQdot_[celli] -= RRg_[i][celli] * hf;
				}
            }
        }
    }
}


template<class CompType, class SolidThermo, class GasThermo>
Foam::scalar
Foam::pyrolysisChemistryModel<CompType, SolidThermo, GasThermo>::solve
(
    const scalar deltaT
)
{
    scalar deltaTMin = great;

    if (!this->chemistry_)
    {
        return deltaTMin;
    }

    const volScalarField rho
    (
        IOobject
        (
            "rho",
            this->time().timeName(),
            this->mesh(),
            IOobject::NO_READ,
            IOobject::NO_WRITE,
            false
        ),
        this->solidThermo().rho()
    );
    
    // Only used in case of using simpleHOR
    myFinalQdot_ = myFinalQdot_ * 0.0;

    forAll(this->RRs_, i)
    {
        this->RRs_[i].field() = 0.0;
    }
    forAll(RRg_, i)
    {
        RRg_[i].field() = 0.0;
    }

    const scalarField& T = this->solidThermo().T();
    const scalarField& p = this->solidThermo().p();

    scalarField c(nSpecie_, 0.0);
    scalarField c0(nSpecie_, 0.0);
    scalarField dc(nSpecie_, 0.0);
    scalarField delta(this->mesh().V());

    forAll(rho, celli)
    {
        if (this->reactingCells_[celli])
        {
            cellCounter_ = celli;

            scalar rhoi = rho[celli];
            scalar pi = p[celli];
            scalar Ti = T[celli];

            for (label i=0; i<this->nSolids_; i++)
            {
                c[i] = rhoi*this->Ys_[i][celli]*delta[celli];
            }

            c0 = c;

            // Initialise time progress
            scalar timeLeft = deltaT;

            // calculate the chemical source terms
            while (timeLeft > small)
            {
                scalar dt = timeLeft;
                this->solve(c, Ti, pi, dt, this->deltaTChem_[celli]);
                timeLeft -= dt;
            }

            deltaTMin = min(this->deltaTChem_[celli], deltaTMin);
            dc = c - c0;

            forAll(this->RRs_, i)
            {
                this->RRs_[i][celli] = dc[i]/(deltaT*delta[celli]);
            }

            forAll(RRg_, i)
            {
                RRg_[i][celli] = dc[this->nSolids_ + i]/(deltaT*delta[celli]);
            }

            // Update Ys0_
            dc = omega(c0, Ti, pi, true);
        }
    }

    // Don't allow the time-step to change more than a factor of 2
    deltaTMin = min(deltaTMin, 2*deltaT);

    return deltaTMin;
}

template<class CompType, class SolidThermo,class GasThermo>
Foam::tmp<Foam::volScalarField>
Foam::pyrolysisChemistryModel<CompType, SolidThermo, GasThermo>::Qdot() const
{
    tmp<volScalarField> tQdot
    (
        new volScalarField
        (
            IOobject
            (
                "Qdot",
                this->mesh_.time().timeName(),
                this->mesh_,
                IOobject::NO_READ,
                IOobject::AUTO_WRITE,
                false
            ),
            this->mesh_,
            dimensionedScalar("zero", dimEnergy/dimVolume/dimTime, 0.0)
        )
    );
    
    scalarField& Qdot = tQdot.ref();

    if (this->chemistry_)
    {
		Qdot = myFinalQdot_;
		
		//old method:
		/*if (useHOR_)
		{
			Qdot = myFinalQdot_;
		}
		else // real chemistry
		{
			forAll(this->Ys_, i)
			{
				scalar hf = this->solidThermo_[i].Hc();
				//Info<<"~~~~~~~~~~~~~~~~ "<<i<<" :\t"<< this->Ys_[i].name()
				//	<<"\t hf=\t"<< hf <<"\t W=\t"<< this->solidThermo_[i].W() <<endl;
				forAll(Qdot, celli)
				{
					Qdot[celli] -= hf*this->RRs_[i][celli];
				}
			}
			
			forAll(gasThermo_, i)
			{
				scalar hf = gasThermo_[i].Hc();
				forAll(Qdot, celli)
				{
					Qdot[celli] -= hf*RRg_[i][celli];
				}
				//Info<<"~~~~~~~~~~~~~~~~ "<<i<<" :\t"<< gasThermo_[i].name()
				//	<<"\t hf=\t"<< hf <<"\t W=\t"<< gasThermo_[i].W() <<endl;
			}
		}*/
    }

    return tQdot;
}


template<class CompType, class SolidThermo,class GasThermo>
Foam::tmp<Foam::volScalarField>
Foam::pyrolysisChemistryModel<CompType, SolidThermo, GasThermo>::gasHs
(
    const volScalarField& p,
    const volScalarField& T,
    const label index
) const
{
    tmp<volScalarField> tHs
    (
        new volScalarField
        (
            IOobject
            (
                "Hs_" + pyrolisisGases_[index],
                this->mesh_.time().timeName(),
                this->mesh_,
                IOobject::NO_READ,
                IOobject::NO_WRITE,
                false
            ),
            this->mesh_,
            dimensionedScalar("zero", dimEnergy/dimMass, 0.0)
        )
    );

    volScalarField::Internal& gasHs = tHs.ref();

    const GasThermo& mixture = gasThermo_[index];

    forAll(gasHs, celli)
    {
        gasHs[celli] = mixture.Hs(p[celli], T[celli]);
    }

    return tHs;
}


template<class CompType, class SolidThermo, class GasThermo>
void Foam::pyrolysisChemistryModel<CompType, SolidThermo, GasThermo>::solve
(
    scalarField &c,
    scalar& T,
    scalar& p,
    scalar& deltaT,
    scalar& subDeltaT
) const
{
    NotImplemented;
}


// ************************************************************************* //
