function outfile_for_nomad (){
	filename=$1
	newname=$2
	cat $filename | awk 'BEGIN {skip = 2;};{if (skip <= 0) print $0;};/^ =====/ {skip -= 1;};' > $newname
}

# Define the target archive
archivename=$1

# Create the archive by including the extraction script
tar cvf $1 extract_for_nomad.sh

# Thiel's set benchmark
tar rvf $1 test_thiels/README.md

# Names of all the molecules
molnames="Acetamide Acetone Adenine Benzene Benzoquinone Butadiene Cyclopentadiene Cyclopropene Cytosine Ethene Formaldehyde Formamide Furan Hexatriene Imidazole Naphthalene Norbornadiene Octatetraene Propanamide Pyrazine Pyridazine Pyridine Pyrimidine Pyrrole Tetrazine Thymine Triazine Uracil"

# SCF files from Thiel's set
# Also includes convergence of ri basis
dirname=7/scf/Results
for name in $molnames; do
	# CP2K input file
	tar rvf $1 test_thiels/$name/$dirname/scf.inp
	# Formatted output file
	outfile_for_nomad test_thiels/$name/$dirname/cp2k.out test_thiels/$name/$dirname/cp2k_nomad.out
	tar rvf $1 test_thiels/$name/$dirname/cp2k_nomad.out
	# Geometry
	tar rvf $1 test_thiels/$name/$dirname/coord.xyz
	# Basis sets
	tar rvf $1 test_thiels/$name/$dirname/aug-cc-pvdz
	tar rvf $1 test_thiels/$name/$dirname/aug-cc-pvtz-rifit
	# Bandstructure
	tar rvf $1 test_thiels/$name/$dirname/bandstructure_SCF_and_G0W0
done
dirname=6/scf/Results
for name in $molnames; do
	# CP2K input file
	tar rvf $1 test_thiels/$name/$dirname/scf.inp
	# Formatted output file
	outfile_for_nomad test_thiels/$name/$dirname/cp2k.out test_thiels/$name/$dirname/cp2k_nomad.out
	tar rvf $1 test_thiels/$name/$dirname/cp2k_nomad.out
	# Geometry
	tar rvf $1 test_thiels/$name/$dirname/coord.xyz
	# Basis sets
	tar rvf $1 test_thiels/$name/$dirname/aug-cc-pvdz
	tar rvf $1 test_thiels/$name/$dirname/aug-cc-pvdz-rifit
	# Bandstructure
	tar rvf $1 test_thiels/$name/$dirname/bandstructure_SCF_and_G0W0
done
dirname=8/scf/Results
for name in $molnames; do
	# CP2K input file
	tar rvf $1 test_thiels/$name/$dirname/scf.inp
	# Formatted output file
	outfile_for_nomad test_thiels/$name/$dirname/cp2k.out test_thiels/$name/$dirname/cp2k_nomad.out
	tar rvf $1 test_thiels/$name/$dirname/cp2k_nomad.out
	# Geometry
	tar rvf $1 test_thiels/$name/$dirname/coord.xyz
	# Basis sets
	tar rvf $1 test_thiels/$name/$dirname/aug-cc-pvtz
	tar rvf $1 test_thiels/$name/$dirname/aug-cc-pvqz-rifit
	# Bandstructure
	tar rvf $1 test_thiels/$name/$dirname/bandstructure_SCF_and_G0W0
done

# LR-BSE files from Thiel's set
dirname=9/bse/Results
for name in $molnames; do
	# CP2K input file
	tar rvf $1 test_thiels/$name/$dirname/bse.inp
	# Formatted output file
	outfile_for_nomad test_thiels/$name/$dirname/cp2k.out test_thiels/$name/$dirname/cp2k_nomad.out
	tar rvf $1 test_thiels/$name/$dirname/cp2k_nomad.out
	# Geometry
	tar rvf $1 test_thiels/$name/$dirname/coord.xyz
	# Basis sets
	tar rvf $1 test_thiels/$name/$dirname/aug-cc-pvdz
	tar rvf $1 test_thiels/$name/$dirname/aug-cc-pvtz-rifit
	# BSE Spectrum
	tar rvf $1 "test_thiels/$name/$dirname/BSE-ABBA-eta=0.130.spectrum"
	tar rvf $1 "test_thiels/$name/$dirname/BSE-ABBA-eta=0.130.crosssection"
done

# RT-BSE files from Thiel's set
directions="x y z"
for direction in $directions; do
	dirname=7/rtbse_$direction/Results
	for name in $molnames; do
		# CP2K input file
		tar rvf $1 test_thiels/$name/$dirname/rtbse.inp
		# Formatted output file
		outfile_for_nomad test_thiels/$name/$dirname/cp2k.out test_thiels/$name/$dirname/cp2k_nomad.out
		tar rvf $1 test_thiels/$name/$dirname/cp2k_nomad.out
		# Geometry
		tar rvf $1 test_thiels/$name/$dirname/coord.xyz
		# Basis sets
		tar rvf $1 test_thiels/$name/$dirname/aug-cc-pvdz
		tar rvf $1 test_thiels/$name/$dirname/aug-cc-pvtz-rifit
		# Moments trace
		tar rvf $1 "test_thiels/$name/$dirname/$name-MOMENTS-1_SPIN_A_RE.dat"
		tar rvf $1 "test_thiels/$name/$dirname/$name-MOMENTS-1_SPIN_A_IM.dat"
		# Polarizability
		tar rvf $1 "test_thiels/$name/$dirname/$name-POL-1.dat"
	done
done

# RT-BSE + Padé files from Thiel's set
directions="x y z"
for direction in $directions; do
	dirname=9/refine_$direction/Results
	for name in $molnames; do
		# CP2K input file
		tar rvf $1 test_thiels/$name/$dirname/rtbse.inp
		# Formatted output file
		outfile_for_nomad test_thiels/$name/$dirname/cp2k.out test_thiels/$name/$dirname/cp2k_nomad.out
		tar rvf $1 test_thiels/$name/$dirname/cp2k_nomad.out
		# Geometry
		tar rvf $1 test_thiels/$name/$dirname/coord.xyz
		# Basis sets
		tar rvf $1 test_thiels/$name/$dirname/aug-cc-pvdz
		tar rvf $1 test_thiels/$name/$dirname/aug-cc-pvtz-rifit
		# Moments trace
		tar rvf $1 "test_thiels/$name/$dirname/$name-MOMENTS-1_SPIN_A_RE.dat"
		tar rvf $1 "test_thiels/$name/$dirname/$name-MOMENTS-1_SPIN_A_IM.dat"
		# Polarizability
		tar rvf $1 "test_thiels/$name/$dirname/$name-POL-1_PADE.dat"
	done
done
dirbasename=9
for name in $molnames; do
	# Information about peaks
	tar rvf $1 test_thiels/$name/$dirbasename/peaks_bse_new.dat
	tar rvf $1 test_thiels/$name/$dirbasename/peaks_rtbse_new.dat
done

# Cysteine scf files
dirname=test_2nd_harmonic/Cysteine
# INFO file
tar rvf $1 $dirname/INFO.md

# Initial SCF,BSE and delta kick calculation

# SCF
dirname=test_2nd_harmonic/Cysteine/1/scf/Results
# CP2K input file
tar rvf $1 $dirname/scf.inp
# Formatted output file
outfile_for_nomad $dirname/cp2k.out $dirname/cp2k_nomad.out
tar rvf $1 $dirname/cp2k_nomad.out
# Geometry
tar rvf $1 $dirname/coord.xyz
# Basis sets
tar rvf $1 $dirname/aug-cc-pvdz
tar rvf $1 $dirname/aug-cc-pvtz-rifit
# Bandstructure
tar rvf $1 $dirname/bandstructure_SCF_and_G0W0

# BSE
dirname=test_2nd_harmonic/Cysteine/1/bse/Results
# CP2K input file
tar rvf $1 $dirname/bse.inp
# Formatted output file
outfile_for_nomad $dirname/cp2k.out $dirname/cp2k_nomad.out
tar rvf $1 $dirname/cp2k_nomad.out
# Geometry
tar rvf $1 $dirname/coord.xyz
# Basis sets
tar rvf $1 $dirname/aug-cc-pvdz
tar rvf $1 $dirname/aug-cc-pvtz-rifit
# BSE Spectrum
tar rvf $1 "$dirname/BSE-ABBA-eta=0.130.spectrum"
tar rvf $1 "$dirname/BSE-ABBA-eta=0.130.crosssection"

# RT-BSE - delta kick
for direction in $directions; do
	dirname=test_2nd_harmonic/Cysteine/1/rtbse_$direction/Results
	# CP2K input file
	tar rvf $1 $dirname/rtbse.inp
	# Formatted output file
	outfile_for_nomad $dirname/cp2k.out $dirname/cp2k_nomad.out
	tar rvf $1 $dirname/cp2k_nomad.out
	# Geometry
	tar rvf $1 $dirname/coord.xyz
	# Basis sets
	tar rvf $1 $dirname/aug-cc-pvdz
	tar rvf $1 $dirname/aug-cc-pvtz-rifit
	# Moments trace
	tar rvf $1 "$dirname/Cysteine-MOMENTS-1_SPIN_A_RE.dat"
	tar rvf $1 "$dirname/Cysteine-MOMENTS-1_SPIN_A_IM.dat"
	# Polarizability
	tar rvf $1 "$dirname/Cysteine-POL-1.dat"
done

# RT-BSE - RT pulse
dirbasename=test_2nd_harmonic/Cysteine/2/rtbse_x
for intensity in 1e10_3 3e10_3 1e11_3 3e11_3; do
	dirname=$dirbasename/Results_$intensity
	# CP2K input file
	tar rvf $1 $dirname/rtbse.inp
	# Formatted output file
	outfile_for_nomad $dirname/cp2k.out $dirname/cp2k_nomad.out
	tar rvf $1 $dirname/cp2k_nomad.out
	# Geometry
	tar rvf $1 $dirname/coord.xyz
	# Basis sets
	tar rvf $1 $dirname/aug-cc-pvdz
	tar rvf $1 $dirname/aug-cc-pvtz-rifit
	# Moments trace
	tar rvf $1 "$dirname/Cysteine-MOMENTS-1_SPIN_A_RE.dat"
	tar rvf $1 "$dirname/Cysteine-MOMENTS-1_SPIN_A_IM.dat"
	# Field trace
	tar rvf $1 "$dirname/Cysteine-FIELD-1.dat"
	# Fourier transform of moments
	tar rvf $1 "$dirname/Cysteine-MOMENTS-FT-1.dat"
	tar rvf $1 "$dirname/Cysteine-MOMENTS-FT-1_PADE.dat"
done

# RT-BSE - timestep check
dirname=test_2nd_harmonic/Cysteine/3/rtbse_x/Results_multi_28
# CP2K input file
tar rvf $1 $dirname/rtbse_28.inp
# Formatted output file
outfile_for_nomad $dirname/cp2k.out $dirname/cp2k_nomad.out
tar rvf $1 $dirname/cp2k_nomad.out
# Geometry
tar rvf $1 $dirname/coord.xyz
# Basis sets
tar rvf $1 $dirname/aug-cc-pvdz
tar rvf $1 $dirname/aug-cc-pvtz-rifit
# Moments trace
tar rvf $1 "$dirname/Cysteine-MOMENTS-1_SPIN_A_RE.dat"
tar rvf $1 "$dirname/Cysteine-MOMENTS-1_SPIN_A_IM.dat"
# Field trace
tar rvf $1 "$dirname/Cysteine-FIELD-1.dat"
# Fourier transform of moments
tar rvf $1 "$dirname/Cysteine-MOMENTS-FT-1.dat"
