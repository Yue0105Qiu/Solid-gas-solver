
// scalar Qdot = chemistry.Qdot()()[0]/rho[0];
// integratedHeat += Qdot*runTime.deltaT().value();

//----------------------------------------------------------------------//
//					    Solid Chemistry									//
//----------------------------------------------------------------------//

chemistryS.calculate();
// dtChem = chemistryS.solve(runTime.deltaT().value());
chemSQdot = chemistryS.Qdot()();
Info << "solveChemistry: dtChem = " << dtChem  << " Qdot = " << chemSQdot[0]<< endl;