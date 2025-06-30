# Solid-gas-solver
A modified chemFoam to include both solid and gas reactions.

The solver distinguishes between gas and solid species via a new entry
`solidSpecies` inside `constant/initialConditions`.  The value is a word list
of species names that are treated as solids.  Solid and gas species are solved
separately but share the same temperature field.  The solver now supports
hPower-based thermodynamic data via additional type handling in
`thermoTypeFunctions.H`.
