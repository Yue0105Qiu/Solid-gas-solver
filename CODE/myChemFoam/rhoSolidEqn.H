//----------------------------------------------------------------------//
//							Solid Spec									//
//----------------------------------------------------------------------//
{	
forAll(Ys, i)
{
	volScalarField rhoSpecI = Ys[i]*rhoS;
	fvScalarMatrix rhoEqnI
	(
		fvm::ddt(rhoSpecI) == chemistryS.RRs(i)
	);
	rhoEqnI.solve(mesh.solver("rho")); // apply a custom solver defined for "rho" in fvSolution.
	rhoSpecI.correctBoundaryConditions();
	rhoSpecI.max(0.0);
	rhoS += rhoSpecI;
}
}
