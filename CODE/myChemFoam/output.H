runTime.write();

// Info<< "chemSQdot = " << chemSQdot[0]
//     << ", T = " << thermoS.T()[0]
//     << ", " << Ys[0].name() << " = " << Ys[0][0]
//     << endl;

// write every 500 steps.
if (runTime.time().value() >= nextWriteTime)
{
    nextWriteTime += writeInterval;
    post << runTime.value() << token::TAB
            << thermoG.T()[0] << token::TAB
            << chemSQdot[0] << token::TAB
            << Ys[0][0]
            << endl;
}
    
    
