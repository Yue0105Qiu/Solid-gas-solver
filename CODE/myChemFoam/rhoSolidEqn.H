//----------------------------------------------------------------------//
//							Solid Spec									//
//----------------------------------------------------------------------//
{	
rhoS = rhoS * 0;
forAll(Ys, i)
{
	volScalarField& rhoSpecI = rhoSI[i];
	Info << "RRs[i] = " << chemistryS.RRs(i)[0] << endl;
	Info << "YSpecI " << Ys[i].name() << " before = " << rhoSpecI[0] / 1100;
	fvScalarMatrix rhoEqnI
	(
		fvm::ddt(rhoSpecI) == chemistryS.RRs(i)
	);
	rhoEqnI.solve(mesh.solver("rho")); // apply a custom solver defined for "rho" in fvSolution.
	Info << " YSpecI after = " << rhoSpecI[0] / 1100 << endl;
	rhoSpecI.max(0.0);
	rhoS += rhoSpecI;
	// Info << "rhoS = " << rhoS[0] << endl;
}
Info << "rhoSolidEqn solved! rhoS = " <<rhoS[0] << endl;
}
