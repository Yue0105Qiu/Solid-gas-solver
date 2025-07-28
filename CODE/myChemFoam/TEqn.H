
{
	volScalarField& T = thermoS.T();
	volScalarField& h = thermoS.he();
	
	volScalarField rhoCpTotal = rhoS * thermoS.Cp() + rhoG * thermoG.Cp();

	fvScalarMatrix TEqn
	(
	  	rhoCpTotal * fvm::ddt(T) == chemSQdot
	);
	
	TEqn.relax();
	TEqn.solve();
	
	T.correctBoundaryConditions();
	h = thermoS.he(thermoS.p(), T);
	thermoS.correct(); 
	thermoS.rho() = rhoS;

	thermoG.T() = thermoS.T();

	volScalarField& hGas = thermoG.he();
	hGas = thermoG.he(thermoG.p(), thermoG.T());
	hGas.correctBoundaryConditions();
	thermoG.correct();
	
}

Info<< "pyrolysis min/max(T) = "
	<< gMin(thermoS.T().primitiveField())
	<< ", "
	<< gMax(thermoS.T().primitiveField())
	<< endl;

