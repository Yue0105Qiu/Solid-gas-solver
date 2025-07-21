//----------------------------------------------------------------------//
//							Solid Spec									//
//----------------------------------------------------------------------//
	fvScalarMatrix rhoEqn
    (
        fvm::ddt(rhoG)
      ==
        chemistryS.RRg()
    );

    rhoEqn.solve(mesh.solver("rho"));
