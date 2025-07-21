// dtChem = chemistry.solve(runTime.deltaT().value());
// scalar Qdot = chemistry.Qdot()()[0]/rho[0];
// integratedHeat += Qdot*runTime.deltaT().value();

//----------------------------------------------------------------------//
//					    Solid Chemistry									//
//----------------------------------------------------------------------//

if (useChemistrySolvers)
{
	chemistryS.solve(runTime.deltaTValue());
}
else
{
	chemistryS.calculate();
}
volScalarField chemSQdot = chemistryS.Qdot()();