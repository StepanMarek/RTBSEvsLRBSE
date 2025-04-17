= Cysteine calculations

 - chosen as a more prolific molecule
 - chiral center - maybe interesting properties in moments translation?
 - still non-centrosymmetric - should produce 2nd harmonic spectrum

== Runs

 - 1 - initial scf + delta kick run
 - 2 - pulse run
     - aim for spread 1 eV around 6 eV center
        - sigma\_t = 4.2 fs
        - lambda = 206.543 nm
        - 3 fs grace time
           - t0 = 12.6 fs
           - T = t0 + 20 fs = 32.6 fs
 - 3 - convergence check for pulse timestep
     - same parameters as 2, but smaller timestep (0.5 as) and stricter ETRS threshold (5e-8) - goes hand in hand
