# Description and Metadata for Thiels set TD-aGW testing

Top dir includes directories for each molecule, those
include numbered runs in CP2K, each with specific input
files and basis files. Largly, try to have a constant set
of parameters for the same number.

 - \*/6 - calculations using aug-cc-pvdz for orbital basis sets
          and aug-cc-pvdz-rifit for auxiliary basis sets
 - \*/7 - calculations using aug-cc-pvdz for orbital basis sets
          and aug-cc-pvtz-rifit for auxiliary basis sets
        - motivated by different results for different GW calculations
          used in CP2K
 - \*/8 - calculations using aug-cc-pvdz for orbital basis sets
          and aug-cc-pvqz-rifit for auxiliary basis sets
 - \*/9 - calculations refining the FT grid using Padé approximants,
          without rerunning the propagation (propagation data taken
          from \*/7)
