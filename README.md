# Solid-gas-solver
A modified chemFoam to include both solid and gas reactions.

The solver distinguishes between gas and solid species via two dictionaries
`solidSpecies` and `gasSpecies` inside `constant/initialConditions`. Each
dictionary lists the species names along with their initial mass or mole
fractions. Species defined inside `solidSpecies` are treated as solids while
the others are gaseous. Both phases share the same temperature field. The solver
now supports hPower-based thermodynamic data via additional type handling in
`thermoTypeFunctions.H`.

The older single `fractions` dictionary format is no longer supported.

## Example case

An example setup is provided in `case/biomassPyrolysis`.  The mechanism
specifies three Arrhenius reactions converting the solid species `BM`
into `TAR` and `CHAR` while releasing gas.  The `solidSpecies` dictionary in
`constant/initialConditions` marks `BM`, `TAR`, and `CHAR` as solids and
initializes their fractions.  Gas-phase species such as `N2` are listed under
`gasSpecies`.
