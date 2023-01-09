#!/bin/bash
#SBATCH --job-name=".bands"
#SBATCH --output=_out_%j
#SBATCH --error=_err_%j
#SBATCH --partition=main
#SBATCH --ntasks=56
#SBATCH --time=12:00:00

export ESPRESSO_TMPDIR=$SLURM_SUBMIT_DIR

SCFWFCSDIR="../"
cp -rp $SCFWFCSDIR/run_output .

INPUT=pw_bands.in
mpirun -n $SLURM_NTASKS pw.x -nk 7 < $INPUT > stdout

INPUT=bands.in
mpirun -n $SLURM_NTASKS bands.x < $INPUT > stdoutbands
