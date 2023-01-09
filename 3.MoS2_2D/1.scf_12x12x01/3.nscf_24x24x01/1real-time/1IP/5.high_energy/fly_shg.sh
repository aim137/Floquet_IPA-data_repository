#!/bin/bash
#SBATCH --job-name=".shg"
#SBATCH --output=_out_%j
#SBATCH --error=_err_%j
#SBATCH --partition=main
#SBATCH --ntasks=112
#SBATCH --time=12:00:00

bins="/s/martin/SOFTWARE/5YAMBO_DEVEL_FLOQUET/yambo-devel-merged-floquet/bin/"
SAVEDIR="../../"

sleep 3
mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i6-nl-shg        -J job04 -C out_job04_shg -I $SAVEDIR
sleep 3
mpirun -n $SLURM_NTASKS $bins/ypp_nl     -F i4-nl-fourier2     -J job04 -C out_job04_shg_00 -I $SAVEDIR
sleep 3
mpirun -n $SLURM_NTASKS $bins/ypp_nl     -F i4-nl-fourier2-hd_01  -J job04 -C out_job04_shg_01 -I $SAVEDIR
sleep 3
mpirun -n $SLURM_NTASKS $bins/ypp_nl     -F i4-nl-fourier2-hd_02  -J job04 -C out_job04_shg_02 -I $SAVEDIR
sleep 3
mpirun -n $SLURM_NTASKS $bins/ypp_nl     -F i4-nl-fourier2-hd_03  -J job04 -C out_job04_shg_03 -I $SAVEDIR
sleep 30
#rm -r job04
