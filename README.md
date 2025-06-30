# Solid-gas-solver
A modified chemFoam to include both solid and gas reactions.

The solver distinguishes between gas and solid species via a new entry
`solidSpecies` inside `constant/initialConditions`.  The value is a word list
of species names that are treated as solids.  Solid and gas species are solved
separately but share the same temperature field.  The solver now supports
hPower-based thermodynamic data via additional type handling in
`thermoTypeFunctions.H`.

## Example case

An example setup is provided in `case/biomassPyrolysis`.  The mechanism
specifies three Arrhenius reactions converting the solid species `BM`
into `GAS`, `TAR`, and `CHAR`.  The `solidSpecies` list in
`constant/initialConditions` marks `BM`, `TAR`, and `CHAR` as solids so
that their transport equations are solved separately from the gas
species while sharing the same temperature field.
