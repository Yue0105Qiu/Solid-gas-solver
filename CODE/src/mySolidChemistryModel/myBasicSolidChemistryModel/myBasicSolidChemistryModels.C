/*---------------------------------------------------------------------------*\
  =========                 |
  \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox
   \\    /   O peration     | Website:  https://openfoam.org
    \\  /    A nd           | Copyright (C) 2013-2018 OpenFOAM Foundation
     \\/     M anipulation  |
-------------------------------------------------------------------------------
License
    This file is part of OpenFOAM.

    OpenFOAM is free software: you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    OpenFOAM is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
    FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
    for more details.

    You should have received a copy of the GNU General Public License
    along with OpenFOAM.  If not, see <http://www.gnu.org/licenses/>.

InClass
    Foam::myBasicSolidChemistryModel

Description
    Creates solid chemistry model instances templated on the type of
    solid thermodynamics

\*---------------------------------------------------------------------------*/

#include "makeSolidChemistryModel.H"

#include "pyrolysisChemistryModel.H"
#include "myBasicSolidChemistryModel.H"
#include "solidChemistryModel.H"
#include "solidThermoPhysicsTypes.H"
#include "thermoPhysicsTypes.H"

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// hConstSolidThermoPhysics

makeSolidChemistryModel
(
    solidChemistryModel,
    pyrolysisChemistryModel,
    myBasicSolidChemistryModel,
    hConstSolidThermoPhysics
);

makeSolidGasChemistryModel
(
    solidChemistryModel,
    pyrolysisChemistryModel,
    myBasicSolidChemistryModel,
    hConstSolidThermoPhysics,
    gasHThermoPhysics
);



// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// hPowerSolidThermoPhysics

makeSolidChemistryModel
(
    solidChemistryModel,
    pyrolysisChemistryModel,
    myBasicSolidChemistryModel,
    hPowerSolidThermoPhysics
);

makeSolidGasChemistryModel
(
    solidChemistryModel,
    pyrolysisChemistryModel,
    myBasicSolidChemistryModel,
    hPowerSolidThermoPhysics,
    gasHThermoPhysics
);



// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// hExpKappaConstSolidThermoPhysics

makeSolidChemistryModel
(
    solidChemistryModel,
    pyrolysisChemistryModel,
    myBasicSolidChemistryModel,
    hExpKappaConstSolidThermoPhysics
);

makeSolidGasChemistryModel
(
    solidChemistryModel,
    pyrolysisChemistryModel,
    myBasicSolidChemistryModel,
    hExpKappaConstSolidThermoPhysics,
    gasHThermoPhysics
);

// Added by Yue on 20250514
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// hjanafKappaConstSolidThermoPhysics

makeSolidChemistryModel
(
    solidChemistryModel,
    pyrolysisChemistryModel,
    myBasicSolidChemistryModel,
    hjanafKappaConstSolidThermoPhysics
);

makeSolidGasChemistryModel
(
    solidChemistryModel,
    pyrolysisChemistryModel,
    myBasicSolidChemistryModel,
    hjanafKappaConstSolidThermoPhysics,
    gasHThermoPhysics
);


// ************************************************************************* //
