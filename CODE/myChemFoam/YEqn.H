{
    // Solve solid species
    forAll(Y, specieI)
    {
        if (isSolid[specieI])
        {
            volScalarField& Yi = Y[specieI];

            solve
            (
                fvm::ddt(rho, Yi) - chemistry.RR(specieI),
                mesh.solver("Yi")
            );
        }
    }

    // Solve gas species
    forAll(Y, specieI)
    {
        if (!isSolid[specieI])
        {
            volScalarField& Yi = Y[specieI];

            solve
            (
                fvm::ddt(rho, Yi) - chemistry.RR(specieI),
                mesh.solver("Yi")
            );
        }
    }
}
