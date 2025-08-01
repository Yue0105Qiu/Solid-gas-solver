# Solid-gas-solver
A modified chemFoam to include both solid and gas kinetics.

The solver distinguishes between gas and solid species via two dictionaries
`solidSpecies` and `gasSpecies` inside `constant/initialConditions`. Each
dictionary lists the species names along with their initial mass or mole
fractions. Species defined inside `solidSpecies` are treated as solids while
the others are gaseous. Both phases share the same temperature field. The solver
now supports janaf-based solid-phase thermodynamic data via additional type handling in
`thermoTypeFunctions.H`.


## Example case

An example setup is provided in `case/biomassPyrolysis`, where you have `constant` folder and `system` folder.

In `constant`:
* `thermophysicalProperties`: the solid-gas kinetics package (pyrolysis). Solid-phase thermo with specified mechanism + gas-phase thermo (by default `psiReactionThermo`) + gas-phase thermo data
* `thermophysicalProperties.gas`: the gas kinetics package (gas reaction). Gas-phase thermo (fixed `psiReactionThermo`) with specified mechanism.
* `chemistryProperties`: specify parameters in solving the solid-gas kinetics.
* `chemistryProperties.gas`: specify parameters in solving the gas kinetics.

In `initialConditions`:

* `constantProperty`: by default constant pressure condition.
* `solidSpecies`: dictionary to specify all the solidSpecies. Other species in the solid-gas kinetics will be treated as gas-phase.
* `gasSpecies`: dictionary to specify the mole/mass fractions of gas species. Missing ones are set to 0 by default.
* `p`: system pressure. 
* `T`: system temperature. solid and gas phases are considered to share the same temperature.
* `probeInterval`: set the output time interval [s] in the `chemFoam.out`.

