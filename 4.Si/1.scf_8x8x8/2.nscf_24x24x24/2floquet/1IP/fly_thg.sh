#!/bin/bash
#SBATCH --job-name=".fl_thg"
#SBATCH --output=_out_%j
#SBATCH --error=_err_%j
#SBATCH --partition=main
#SBATCH --ntasks=112
#SBATCH --time=12:00:00

bins="/s/martin/SOFTWARE/5YAMBO_DEVEL_FLOQUET/yambo-devel-floquet/bin/"
SAVEDIR="../../1THG"

#mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i1-fl-thg           -J job01 -C out_job01_thg    -I $SAVEDIR

#mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i2-fl-thg           -J job02 -C out_job02_thg    -I $SAVEDIR

#mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i3-fl-thg           -J job03 -C out_job03_thg    -I $SAVEDIR

mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i4-fl-thg           -J job04 -C out_job04_thg    -I $SAVEDIR
