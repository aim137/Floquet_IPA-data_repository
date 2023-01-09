#!/bin/bash
#SBATCH --job-name=".scf"
#SBATCH --output=_out_%j
#SBATCH --error=_err_%j
#SBATCH --partition=main
#SBATCH --ntasks=56
#SBATCH --time=03:00:00

export ESPRESSO_TMPDIR=$SLURM_SUBMIT_DIR

INPUT=pw_scf.in
mpirun -n $SLURM_NTASKS pw.x -nk 8 < $INPUT > stdout
