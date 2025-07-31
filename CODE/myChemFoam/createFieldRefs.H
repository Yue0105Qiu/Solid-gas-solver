// BasicChemistryModel<psiReactionThermo>& chemistry = pChemistry();

myBasicSolidChemistryModel&  chemistryS = pChemistryS();
scalar dtChem = min
(
    refCast<const myBasicSolidChemistryModel>
    (
        chemistryS
    ).deltaTChem()[0],
    runTime.deltaT().value()
);

basicSpecieMixture& compositionG = thermoG.composition();
PtrList<volScalarField>& Yg = compositionG.Y();

basicSpecieMixture& compositionS = thermoS.composition();
PtrList<volScalarField>& Ys = thermoS.composition().Y();

volScalarField& p = thermoG.p();
