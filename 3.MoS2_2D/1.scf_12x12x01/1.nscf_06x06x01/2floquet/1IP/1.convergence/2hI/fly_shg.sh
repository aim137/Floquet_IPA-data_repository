#!/bin/bash
#SBATCH --job-name=".floquet"
#SBATCH --output=_out_%j
#SBATCH --error=_err_%j
#SBATCH --partition=main
#SBATCH --ntasks=112
#SBATCH --time=12:00:00

bins="/s/martin/SOFTWARE/5YAMBO_DEVEL_FLOQUET/yambo-devel-floquet/bin/"
SAVEDIR="../../../../3nonlinear"

mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i0-fl-shg -J job00 -C out_job00_shg_plus0 -I $SAVEDIR
sleep 30
rm -r job00
mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i1-fl-shg -J job01 -C out_job01_shg_plus1 -I $SAVEDIR
sleep 30
rm -r job01
mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i2-fl-shg -J job02 -C out_job02_shg_plus2 -I $SAVEDIR
sleep 30
rm -r job02
