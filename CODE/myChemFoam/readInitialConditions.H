const word constProp(initialConditions.lookup("constantProperty"));
if ((constProp != "pressure") && (constProp != "volume"))
{
    FatalError << "in initialConditions, unknown constantProperty type "
        << constProp << nl << " Valid types are: pressure volume."
        << abort(FatalError);
}

const word fractionBasis(initialConditions.lookup("fractionBasis"));
if ((fractionBasis != "mass") && (fractionBasis != "mole"))
{
    FatalError << "in initialConditions, unknown fractionBasis type " << nl
        << "Valid types are: mass or mole."
        << fractionBasis << abort(FatalError);
}

const label nSpecieG = Yg.size();
const label nSpecieS = Ys.size();
const scalarList Wg(::W(thermoG));
// Info << "Wg = " << Wg << endl;
const scalarList Ws(::W(thermoS));
// Info << "Ws = " << Ws << endl;

scalarList Yg0(nSpecieG, 0.0);
scalarList Xg0(nSpecieG, 0.0);
scalarList Ys0(nSpecieS, 0.0);
scalarList Xs0(nSpecieS, 0.0);

// The initial composition is provided via two dictionaries
// `solidSpecies` and `gasSpecies`.  Each dictionary maps specie
// names to their initial fractions.  The old `fractions` format is
// no longer supported.

dictionary solidFractions;
dictionary gasFractions;

if (initialConditions.found("solidSpecies"))
{
    solidFractions = initialConditions.subDict("solidSpecies");
}

if (initialConditions.found("gasSpecies"))
{
    gasFractions = initialConditions.subDict("gasSpecies");
}


forAllConstIter(dictionary, solidFractions, iter)
{
    const word specName(iter().keyword());
    bool found = false;
    forAll(Ys, i)
    {
        if (specName == Ys[i].name())
        {
            found = true;
            break;
        }
    }
    if (!found)
    {
        FatalErrorInFunction
            << "Solid specie " << specName << " not found in mixture"
            << exit(FatalError);
    }
}

forAllConstIter(dictionary, gasFractions, iter)
{
    const word specName(iter().keyword());
    bool found = false;
    forAll(Yg, i)
    {
        // Info << Yg[i].name() << endl;
        if (specName + ".gas" == Yg[i].name() )
        {
            found = true;
            break;
        }
    }
    
    if (!found)
    {
        FatalErrorInFunction
            << "Gas specie " << specName << " not found in mixture"
            << exit(FatalError);
    }
}

// Info << "Solid / gas species read!" << endl;

if (fractionBasis == "mole") // mole fraction
{
    // gas-phase species
    forAll(Yg, i)
    {
        const word& name = Yg[i].name();
        if (gasFractions.found(name))
        {
            Xg0[i] = readScalar(gasFractions.lookup(name));
        }
    }
    scalar mwg = 0.0;
    const scalar mTotg = sum(Xg0);
    forAll(Yg, i)
    {
        Xg0[i] /= mTotg;
        mwg += Wg[i]*Xg0[i];
    }
    forAll(Yg, i)
    {
        Yg0[i] = Xg0[i]*Wg[i]/mwg;
    }
    

    // solid-phase species
    forAll(Ys, i)
    {
        const word& name = Ys[i].name();
        if (solidFractions.found(name))
        {
            Xs0[i] = readScalar(solidFractions.lookup(name));
        }
    }

    scalar mws = 0.0;
    const scalar mTots = sum(Xs0);
    forAll(Ys, i)
    {
        Xs0[i] /= mTots;
        mws += Ws[i]*Xs0[i];
    }

    forAll(Ys, i)
    {
        Ys0[i] = Xs0[i]*Ws[i]/mws;
    }
}
else  // mass fraction
{
    // gas-phase species
    forAll(Yg, i)
    {
        const word& fullname = Yg[i].name() ;
        const word name = fullname.substr(0,fullname.size()-4);
        if (gasFractions.found(name))
        {
            Yg0[i] = readScalar(gasFractions.lookup(name));
        }
    }
    scalar invWg = 0.0;
    const scalar mTotg = sum(Yg0);
    forAll(Yg, i)
    {
        Yg0[i] /= mTotg;
        invWg += (Yg0[i] < small)? 0:(Yg0[i]/Wg[i]);
    }
    const scalar mwg = 1.0/invWg;

    forAll(Yg, i)
    {
        Xg0[i] = Yg0[i]*mwg/Wg[i];
    }


    // solid-phase species
    forAll(Ys, i)
    {
        const word& name = Ys[i].name();
        if (solidFractions.found(name))
        {
            Ys0[i] = readScalar(solidFractions.lookup(name));
        }
    }

    scalar invWs = 0.0;
    const scalar mTots = sum(Ys0);
    forAll(Ys, i)
    {
        Ys0[i] /= mTots;
        invWs += (Ys0[i] < small)? 0:(Ys0[i]/Ws[i]);
    }
    const scalar mws = 1.0/invWs;

    forAll(Ys, i)
    {
        Xs0[i] = Ys0[i]*mws/Ws[i];
    }
}



// const scalar h0 = ::h0(thermo, Y0, p[0], T0);

forAll(Yg, i)
{
    Yg[i] = Yg0[i];
}


forAll(Ys, i)
{
    Ys[i] = Ys0[i];
}

// thermoG.he() = dimensionedScalar("h", dimEnergy/dimMass, h0);
// thermoG.correct();

// rhoG = thermoG.rho();
// scalar rho0 = rho[0];
// scalar u0 = h0 - p0/rho0;
// scalar R0 = p0/(rho0*T0);
// Rspecific[0] = R0;

// scalar integratedHeat = 0.0;

Info << constProp << " will be held constant." << nl
    << " p   = " << p[0] << " [Pa]" << nl
    << " T   = " << thermoG.T()[0] << " [K] " << nl
    << " rhoG = " << rhoG[0] << " [kg/m3]" << nl
    << endl;
