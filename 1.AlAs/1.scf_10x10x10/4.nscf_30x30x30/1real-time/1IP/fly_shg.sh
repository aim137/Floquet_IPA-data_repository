#!/bin/bash
#SBATCH --job-name=".shg"
#SBATCH --output=_out_%j
#SBATCH --error=_err_%j
#SBATCH --partition=main
#SBATCH --nodes=4
#SBATCH --tasks-per-node=9
#SBATCH --time=12:00:00

bins="/s/martin/SOFTWARE/5YAMBO_DEVEL_FLOQUET/yambo-devel-floquet/bin/"
bypp="/s/martin/SOFTWARE/3YAMBO_MASTER/yambo-devel-2prec/bin/"
SAVEDIR="../"

mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i1-nl-firstorder -J job01 -C out_job01_firstorder -I $SAVEDIR
sleep 3
mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i2-nl-fourier    -J job01 -C out_job01_firstorder -I $SAVEDIR
sleep 3
mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i5-nl-fourier    -J job01 -C out_job03_firstorder -I $SAVEDIR
sleep 3
#mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i3-nl-shg        -J job02 -C out_job02_shg -I $SAVEDIR
#sleep 3
#mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i4-nl-fourier2   -J job02 -C out_job02_shg -I $SAVEDIR
#sleep 30
#rm -r job02
#sleep 3
#mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i6-nl-shg        -J job04 -C out_job04_shg -I $SAVEDIR
#sleep 3
#mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i4-nl-fourier2   -J job04 -C out_job04_shg -I $SAVEDIR
#sleep 30
#rm -r job04
