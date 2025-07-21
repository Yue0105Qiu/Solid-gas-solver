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

    const label nSpecie = Y.size();
    const scalarList W(::W(thermo));

    scalarList Y0(nSpecie, 0.0);
    scalarList X0(nSpecie, 0.0);

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

    isSolid.setSize(nSpecie, false);

    forAll(Y, i)
    {
        const word& name = Y[i].name();
        if (solidFractions.found(name))
        {
            isSolid[i] = true;
        }
    }

    forAllConstIter(dictionary, solidFractions, iter)
    {
        const word specName(iter().keyword());
        bool found = false;
        forAll(Y, i)
        {
            if (specName == Y[i].name())
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
        forAll(Y, i)
        {
            if (specName == Y[i].name())
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


    if (fractionBasis == "mole") // mole fraction
    {
        forAll(Y, i)
        {
            const word& name = Y[i].name();
            if (solidFractions.found(name))
            {
                X0[i] = readScalar(solidFractions.lookup(name));
            }
            else if (gasFractions.found(name))
            {
                X0[i] = readScalar(gasFractions.lookup(name));
            }
        }

        scalar mw = 0.0;
        const scalar mTot = sum(X0);
        forAll(Y, i)
        {
            X0[i] /= mTot;
            mw += W[i]*X0[i];
        }

        forAll(Y, i)
        {
            Y0[i] = X0[i]*W[i]/mw;
        }
    }
    else  // mass fraction
    {
        forAll(Y, i)
        {
            const word& name = Y[i].name();
            if (solidFractions.found(name))
            {
                Y0[i] = readScalar(solidFractions.lookup(name));
            }
            else if (gasFractions.found(name))
            {
                Y0[i] = readScalar(gasFractions.lookup(name));
            }
        }

        scalar invW = 0.0;
        const scalar mTot = sum(Y0);
        forAll(Y, i)
        {
            Y0[i] /= mTot;
            invW += Y0[i]/W[i];
        }
        const scalar mw = 1.0/invW;

        forAll(Y, i)
        {
            X0[i] = Y0[i]*mw/W[i];
        }
    }



    const scalar h0 = ::h0(thermo, Y0, p[0], T0);

    forAll(Y, i)
    {
        Y[i] = Y0[i];
    }

    thermo.he() = dimensionedScalar("h", dimEnergy/dimMass, h0);
    thermo.correct();

    rho = thermo.rho();
    scalar rho0 = rho[0];
    scalar u0 = h0 - p0/rho0;
    scalar R0 = p0/(rho0*T0);
    Rspecific[0] = R0;

    scalar integratedHeat = 0.0;

    Info << constProp << " will be held constant." << nl
        << " p   = " << p[0] << " [Pa]" << nl
        << " T   = " << thermo.T()[0] << " [K] " << nl
        << " rho = " << rho[0] << " [kg/m3]" << nl
        << endl;
