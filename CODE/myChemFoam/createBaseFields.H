// write base thermo fields - not registered since will be re-read by
// thermo package

Info<< "Creating base fields for time " << runTime.timeName() << endl;
{
    scalar p0 = readScalar(initialConditions.lookup("p"));
    scalar T0 = readScalar(initialConditions.lookup("T"));
    
    volScalarField Ydefault
    (
        IOobject
        (
            "Ydefault",
            runTime.timeName(),
            mesh,
            IOobject::READ_IF_PRESENT,
            IOobject::NO_WRITE,
            false
        ),
        mesh,
        dimensionedScalar("Ydefault", dimless, 1)
    );

    Ydefault.write();

    volScalarField Y0Default
    (
        IOobject
        (
            "Y0Default",
            runTime.timeName(),
            mesh,
            IOobject::READ_IF_PRESENT,
            IOobject::NO_WRITE,
            false
        ),
        mesh,
        dimensionedScalar("Y0Default", dimless, 1)
    );

    Y0Default.write();

    volScalarField Ydefault_gas
    (
        IOobject
        (
            "Ydefault.gas",
            runTime.timeName(),
            mesh,
            IOobject::READ_IF_PRESENT,
            IOobject::NO_WRITE,
            false
        ),
        mesh,
        dimensionedScalar("Ydefault", dimless, 1)
    );

    Ydefault_gas.write();

    volScalarField p
    (
        IOobject
        (
            "p",
            runTime.timeName(),
            mesh,
            IOobject::READ_IF_PRESENT,
            IOobject::NO_WRITE,
            false
        ),
        mesh,
        dimensionedScalar("p", dimPressure, p0)
    );

    p.write();

    volScalarField T
    (
        IOobject
        (
            "T",
            runTime.timeName(),
            mesh,
            IOobject::READ_IF_PRESENT,
            IOobject::NO_WRITE,
            false
        ),
        mesh,
        dimensionedScalar("T", dimTemperature, T0)
    );

    T.write();

    volScalarField T_gas
    (
        IOobject
        (
            "T.gas",
            runTime.timeName(),
            mesh,
            IOobject::READ_IF_PRESENT,
            IOobject::NO_WRITE,
            false
        ),
        mesh,
        dimensionedScalar("T", dimTemperature, T0)
    );

    T_gas.write();
}
