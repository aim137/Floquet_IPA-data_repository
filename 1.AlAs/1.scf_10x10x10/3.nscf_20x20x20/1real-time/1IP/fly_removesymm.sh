#!/bin/bash
#SBATCH --job-name=".fixsymm"
#SBATCH --output=_out_%j
#SBATCH --error=_err_%j
#SBATCH --partition=main
#SBATCH --ntasks=28
#SBATCH --time=09:00:00

SAVEDBDIR="../../0nscf"
SAVE=$SAVEDBDIR

sleep 3                      
mpirun -n $SLURM_NTASKS ypp_nl -F i0-nl-removesymm  -I $SAVE
sleep 3
mpirun -n $SLURM_NTASKS yambo_nl 
mv r_fixsyms r_setup SAVE
if [ -f l_fixsyms ]; then mv l_fixsyms SAVE;fi
if [ -f l_setup ]; then mv l_setup SAVE;fi
if [ -d LOG ]; then mv LOG SAVE;fi
