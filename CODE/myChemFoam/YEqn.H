// gas-phase species. Here we assume that Yg contains all the species in the gas phase, i.e., there is no gas-phase reaction.

label inertIndex = -1;
if (Yg.size())
{
	const word inertSpecie(thermoG.lookup("inertSpecie"));
	if (!compositionG.species().found(inertSpecie))
	{
		FatalIOErrorIn(args.executable().c_str(), thermoG)
			<< "Inert specie " << inertSpecie
			<< " not found in available species "
			<< compositionG.species()
			<< exit(FatalIOError);
	}
	inertIndex = compositionG.species()[inertSpecie];
}



volScalarField Yt(0.0*Yg[0]);
const speciesTable& gasTable = chemistryS.gasTable(); // gas species in pyrolysis mechanism. Species name without ".gas"
// const psiReactionThermo& gasThermo = chemistryS.gasThermo(); 

forAll(Yg, specieI)
{
	if (specieI != inertIndex)
	{
		volScalarField& Yi = Yg[specieI];
		// Info << "Before: Yi " << Yg[specieI].name() << " " << Yi[0] << endl;
		
		// Find the source term in the gas phase 
		label j=-1;
		volScalarField::Internal sourceGasI = 0 * chemistryS.RRg(0);

		forAll(gasTable, gasI)
		{
			if (gasTable[gasI]+".gas" == Yg[specieI].name())
			{
				j = gasI;
			}
		}

		if (j>-1)
		{
			sourceGasI = chemistryS.RRg(j);
			const scalar specie_p = thermoS.p()[0];
			const scalar specie_T = thermoS.T()[0];
			Info<< gasTable[j] << " is available. RRg = " << sourceGasI[0] << " Ha = " << compositionG.Ha(specieI, specie_p, specie_T) << endl;
			
		}
		else
		{
			// Info<< Yg[specieI].name() << " is not available!!!" << endl;// Comment by Yue
		}

		fvScalarMatrix YiEqn
		(
			fvm::ddt(rhoG, Yi) == sourceGasI 
		);

		YiEqn.relax();
		//fvOptions.constrain(YiEqn);
		YiEqn.solve(mesh.solver("Yi"));
		//fvOptions.correct(Yi);
		Yi.max(0.0); // This is to avoid negative Yi
		Yt += Yi;
		// Info << "After: Yi " << Yg[specieI].name() << " " << Yi[0] << endl;
	}
}

Info << "Max.Yt = " << gMax(Yt) << endl;
if (gMax(Yt) > 1.0)
{
	Info<< "------>WARNING : gMax(Yt) = "<< gMax(Yt) <<endl;
	label n = 0;
	forAll(Yt, celli)
	{
		if (Yt[celli] > 1.0)
		{
			n++;
			forAll(Yg, specieI)
			{
				Yg[specieI][celli] /= Yt[celli];
			}
			Yt[celli] = 1.0;
		}
	}
	Info<<"Yt > 1.0 in "<< n << " cells!"<<endl<<endl;
}

Yg[inertIndex] = scalar(1) - Yt;
Info << "N2 = " << gMax(Yg[inertIndex]) << endl;
Yg[inertIndex].max(0.0);
