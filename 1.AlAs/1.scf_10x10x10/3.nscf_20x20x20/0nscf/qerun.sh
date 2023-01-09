#!/bin/bash
#SBATCH --job-name=".nscf"
#SBATCH --output=_out_%j
#SBATCH --error=_err_%j
#SBATCH --partition=main
#SBATCH --ntasks=84
#SBATCH --time=12:00:00

export ESPRESSO_TMPDIR=$SLURM_SUBMIT_DIR

SCFWFCSDIR="../../0scf"
cp -rp $SCFWFCSDIR/run_output .

INPUT=pw_nscf.in
mpirun -n $SLURM_NTASKS pw.x -nk 7 < $INPUT > stdout

QEoutdir=`grep outdir $SLURM_SUBMIT_DIR/$INPUT | cut -d '=' -f 2 | tr -d "'" | tr -d " "`
if [ -z $QEoutdir ]; then QEoutdir=run_*;fi
cd $SLURM_SUBMIT_DIR/$QEoutdir/*.save/
p2y
mv l_p2y SAVE
mv SAVE $SLURM_SUBMIT_DIR
cd $SLURM_SUBMIT_DIR
mpirun -np $SLURM_NTASKS yambo_master
