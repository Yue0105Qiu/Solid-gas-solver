
{
	volScalarField& T = thermoS.T();
	volScalarField& h = thermoS.he();
	volScalarField rhoCpTotal = rhoS * thermoS.Cp() + rhoG * thermoG.Cp();
	Info << "T = " << T[0] << " h = " << h[0] << " rhoCpTotal = " << rhoCpTotal[0] << endl;
	fvScalarMatrix TEqn
	(
	  	rhoCpTotal * fvm::ddt(T) == chemSQdot
	);
	TEqn.relax();
	TEqn.solve();
	
	h = thermoS.he(thermoS.p(), T);
	thermoS.correct(); 
	thermoS.rho() = rhoS;

	thermoG.T() = thermoS.T();

	volScalarField& hGas = thermoG.he();
	hGas = thermoG.he(thermoG.p(), thermoG.T());
	thermoG.correct();
	
}

Info<< "pyrolysis T = " << thermoS.T()[0] << endl;

