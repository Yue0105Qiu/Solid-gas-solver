    runTime.write();

    Info<< "chemSQdot = " << chemSQdot[0]
        << ", T = " << thermoG.T()[0]
        << ", " << Ys[0].name() << " = " << Ys[0][0]
        << endl;

    post<< runTime.value() << token::TAB << thermoG.T()[0] << token::TAB
        << endl;
