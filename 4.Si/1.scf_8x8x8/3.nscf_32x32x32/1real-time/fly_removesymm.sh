#!/bin/bash
#SBATCH --job-name=".fixsymm"
#SBATCH --output=_out_%j
#SBATCH --error=_err_%j
#SBATCH --partition=main
#iiiSBATCH --ntasks=112
#SBATCH --nodes=4
#SBATCH --tasks-per-node=4
#SBATCH --time=09:00:00

SAVEDBDIR="../0nscf"
SAVE=$SAVEDBDIR
bins="/s/martin/SOFTWARE/5YAMBO_DEVEL_FLOQUET/yambo-devel-floquet/bin/"

sleep 3                      
#mpirun -n $SLURM_NTASKS $bins/ypp_nl -F i0-nl-removesymm  -I $SAVE
sleep 3
mpirun -n $SLURM_NTASKS $bins/yambo_fl 
mv r_fixsyms r_setup SAVE
if [ -f l_fixsyms ]; then mv l_fixsyms SAVE;fi
if [ -f l_setup ]; then mv l_setup SAVE;fi
if [ -d LOG ]; then mv LOG SAVE;fi
