// gas-phase species. Here we assume that Yg contains all the species in the gas phase, i.e., there is no gas-phase reaction.

label inertIndex = -1;
if (Yg.size())
{
	const word inertSpecie(thermoG.lookup("inertSpecie"));
	if (!compositionG.species().found(inertSpecie))
	{
		FatalIOErrorIn(args.executable().c_str(), thermoG)
			<< "Inert specie " << inertSpecie
			<< " not found in available species "
			<< compositionG.species()
			<< exit(FatalIOError);
	}
	inertIndex = compositionG.species()[inertSpecie];
}



volScalarField Yt(0.0*Yg[0]);
const speciesTable& gasTable = chemistryS.gasTable();

forAll(Yg, specieI)
{
	if (specieI != inertIndex)
	{
		volScalarField& Yi = Yg[specieI];
		
		// Find the source term in the gas phase 
		label j=-1;
		volScalarField::Internal sourceGasI = 0 * chemistryS.RRg(0);

		forAll(gasTable, gasI)
		{
			if (gasTable[gasI]+".gas" == Yg[specieI].name())
			{
				j = gasI;
			}
		}

		if (j>-1)
		{
			//Info<< gasTable[j] << " is available." << endl;
			sourceGasI = chemistryS.RRg(j);
		}
		else
		{
			Info<< Yg[specieI].name() << " is not available!!!" << endl;
		}

		fvScalarMatrix YiEqn
		(
			fvm::ddt(rhoG, Yi) == sourceGasI 
		);

		YiEqn.relax();
		//fvOptions.constrain(YiEqn);
		YiEqn.solve(mesh.solver("Yi"));
		Yi.correctBoundaryConditions();
		//fvOptions.correct(Yi);
		Yi.max(0.0); // This is to avoid negative Yi
		Yt += Yi;
	}
}

if (gMax(Yt) > 1.0)
{
	Info<< "------>WARNING : gMax(Yt) = "<< gMax(Yt) <<endl;
	label n = 0;
	forAll(Yt, celli)
	{
		if (Yt[celli] > 1.0)
		{
			n++;
			forAll(Yg, specieI)
			{
				Yg[specieI][celli] /= Yt[celli];
			}
			Yt[celli] = 1.0;
		}
	}
	Info<<"Yt > 1.0 in "<< n << " cells!"<<endl<<endl;
}

Yg[inertIndex] = scalar(1) - Yt;
Yg[inertIndex].correctBoundaryConditions();
Yg[inertIndex].max(0.0);
