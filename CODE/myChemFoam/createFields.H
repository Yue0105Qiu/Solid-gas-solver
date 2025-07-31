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

#include "createBaseFields.H"

Info<< "Reading thermophysical properties for gas\n" << endl;
/* The solver will check the thermophysicalProperties.gas file.
All the species in this thermo class is suffixed with ".gas" */
autoPtr<psiReactionThermo> pThermo(psiReactionThermo::New(mesh, "gas").ptr()); 
psiReactionThermo& thermoG = pThermo();
// thermoG.validate(args.executable(), "h.gas");

autoPtr<BasicChemistryModel<psiReactionThermo>> pChemistry
(
    BasicChemistryModel<psiReactionThermo>::New(thermoG)
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


Info<< "Reading thermophysical properties for solid\n" << endl;
/* The solver will check the thermophysicalProperties file.
The gas species in this file do not need to contain all the gas species in the thermophysicalProperties.gas file*/
autoPtr<solidReactionThermo> pThermoS(solidReactionThermo::New(mesh));
solidReactionThermo& thermoS = pThermoS();
// thermoS.validate(args.executable(), "h");
autoPtr<myBasicSolidChemistryModel> pChemistryS
(
    myBasicSolidChemistryModel::veryNew(thermoS)
);
pChemistryS().setGasThermoPtr(thermoG);

volScalarField chemSQdot
(
    IOobject
    (
        "Qdot",
        runTime.timeName(),
        mesh,
        IOobject::READ_IF_PRESENT,
        IOobject::AUTO_WRITE
    ),
    mesh,
    dimensionedScalar("Qdot", dimEnergy/dimVolume/dimTime, 0.0)
);

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
    mesh,
    dimensionedScalar("rhoS", dimMass/dimVolume, 0.0)
);
rhoS = thermoS.rho();



PtrList<volScalarField> rhoSI(thermoS.composition().Y().size());
forAll(rhoSI, j)
{
    // const volScalarField& Ysj = thermoS.composition().Y()[j];
    rhoSI.set
    (
        j,
        new volScalarField
        (
            IOobject
            (
                "rho_" + thermoS.composition().Y()[j].name(),
                runTime.timeName(),
                mesh,
                IOobject::NO_READ,
                IOobject::NO_WRITE
            ), 
            thermoS.composition().Y()[j] * thermoS.rho()  
        )
    );
}

Info << "Generating output file to the work folder" << endl;
scalar nextWriteTime = 0.0;
const scalar  writeInterval = initialConditions.lookupOrDefault<scalar>("probeInterval", 1);

OFstream post(args.path()/"chemFoam.out");
post<< "# Time" << token::TAB
    << "Temperature [K]" << token::TAB
    << "Qdot " << token::TAB
    << "Ys[0]" << endl;