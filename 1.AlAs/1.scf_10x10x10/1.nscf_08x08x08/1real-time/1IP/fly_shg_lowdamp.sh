#!/bin/bash
#SBATCH --job-name=".fixsymm"
#SBATCH --output=_out_%j
#SBATCH --error=_err_%j
#SBATCH --partition=main
#SBATCH --ntasks=56
#SBATCH --time=09:00:00

bins="/s/martin/SOFTWARE/3YAMBO_MASTER/yambo-devel-2prec/bin/"

#mpirun -n $SLURM_NTASKS $bins/yambo_nl   -F i1-nl-firstorder -J job01 -C out_job01_firstorder
sleep 3
#mpirun -n $SLURM_NTASKS $bins/ypp_nl     -F i2-nl-fourier    -J job01 -C out_job01_firstorder
sleep 3
mpirun -n $SLURM_NTASKS $bins/yambo_nl   -F i3-nl-shg_lowdamp        -J job02b -C out_job02_shg_lowdamp
sleep 3
mpirun -n $SLURM_NTASKS $bins/ypp_nl     -F i4-nl-fourier2   -J job02b -C out_job02_shg_lowdamp
