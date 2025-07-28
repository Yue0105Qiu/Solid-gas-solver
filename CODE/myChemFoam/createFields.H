    if (mesh.nCells() != 1)
    {
        FatalErrorInFunction
            << "Solver only applicable to single cell cases"
            << exit(FatalError);
    }

    Info<< "Reading initial conditions.\n" << endl;
    IOdictionary initialConditions
    (
        IOobject
        (
            "initialConditions",
            runTime.constant(),
            mesh,
            IOobject::MUST_READ_IF_MODIFIED,
            IOobject::NO_WRITE
        )
    );

    scalar p0 = readScalar(initialConditions.lookup("p"));
    scalar T0 = readScalar(initialConditions.lookup("T"));

    #include "createBaseFields.H"

    Info<< "Reading thermophysical properties for gas\n" << endl;
    autoPtr<rhoReactionThermo> pThermo(rhoReactionThermo::New(mesh, "gas")); // will check the thermophysicalProperties file
    rhoReactionThermo& thermoG = pThermo();
    // thermoG.validate(args.executable(), "h.gas");

    autoPtr<BasicChemistryModel<rhoReactionThermo>> pChemistry
    (
        BasicChemistryModel<rhoReactionThermo>::New(thermoG)
    );


    volScalarField rhoG
    (
        IOobject
        (
            "rhoG",
            runTime.timeName(),
            mesh,
            IOobject::NO_READ,
            IOobject::AUTO_WRITE
        ),
        thermoG.rho()
    );

    volScalarField Rspecific
    (
        IOobject
        (
            "Rspecific",
            runTime.timeName(),
            mesh,
            IOobject::NO_READ,
            IOobject::AUTO_WRITE
        ),
        mesh,
        dimensionedScalar
        (
            "zero",
            dimensionSet(dimEnergy/dimMass/dimTemperature),
            0.0
        )
    );

    volVectorField U
    (
        IOobject
        (
            "U",
            runTime.timeName(),
            mesh,
            IOobject::NO_READ,
            IOobject::NO_WRITE
        ),
        mesh,
        dimensionedVector("zero", dimVelocity, Zero)
    );

    #include "createPhi.H"

    OFstream post(args.path()/"chemFoam.out");
    post<< "# Time" << token::TAB << "Temperature [K]" << token::TAB
        << "Pressure [Pa]" << endl;

    boolList isSolid;

    // Variables for solid phase
    autoPtr<solidReactionThermo> pThermoS(solidReactionThermo::New(mesh));
    solidReactionThermo& thermoS = pThermoS();
    // thermoS.validate(args.executable(), "h");
    autoPtr<myBasicSolidChemistryModel> pChemistryS
    (
        myBasicSolidChemistryModel::veryNew(thermoS)
    );

    Info << "leave myBasicSolidChemistryModel" << endl;

    // PtrList<volScalarField> QdotsSolid();
    volScalarField rhoS
    (
        IOobject
        (
            "rhoS",
            runTime.timeName(),
            mesh,
            IOobject::NO_READ,
            IOobject::AUTO_WRITE
        ),
        thermoS.rho()
    );



