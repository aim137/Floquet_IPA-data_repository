#!/bin/bash
#SBATCH --job-name=".floquet"
#SBATCH --output=_out_%j
#SBATCH --error=_err_%j
#SBATCH --partition=main
#SBATCH --ntasks=112
#SBATCH --time=12:00:00

bins="/s/martin/SOFTWARE/5YAMBO_DEVEL_FLOQUET/yambo-devel-floquet/bin/"
SAVEDIR="../../../3nonlinear"

mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i1-fl-LR -J job01 -C out_job01_LR_ld -I $SAVEDIR
sleep 30
rm -r job01
mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i2-fl-LR -J job02 -C out_job02_LR_hd -I $SAVEDIR
sleep 30
rm -r job02
mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i3-fl-LR -J job03 -C out_job03_LR_hd -I $SAVEDIR
sleep 30
rm -r job03
mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i4-fl-LR -J job04 -C out_job04_LR_hd -I $SAVEDIR
sleep 30
rm -r job04
mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i5-fl-LR -J job05 -C out_job05_LR_hd -I $SAVEDIR
sleep 30
rm -r job05
mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i6-fl-LR -J job06 -C out_job06_LR_hd -I $SAVEDIR
sleep 30
rm -r job06
