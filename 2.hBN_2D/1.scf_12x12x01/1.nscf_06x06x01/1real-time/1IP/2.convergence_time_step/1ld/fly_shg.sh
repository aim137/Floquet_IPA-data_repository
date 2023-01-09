#!/bin/bash
#SBATCH --job-name=".shg"
#SBATCH --output=_out_%j
#SBATCH --error=_err_%j
#SBATCH --partition=main
#SBATCH --ntasks=112
#SBATCH --time=12:00:00


bins="/s/martin/SOFTWARE/5YAMBO_DEVEL_FLOQUET/yambo-devel-floquet/bin/"
bypp="/s/martin/SOFTWARE/3YAMBO_MASTER/yambo-devel-2prec/bin/"
SAVEDIR="../../../"

#mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i1-nl-shg        -J job01 -C out_job01_shg -I $SAVEDIR
#sleep 3
#mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i8-nl-fourier    -J job01 -C out_job01_shg -I $SAVEDIR
#sleep 3
#rm -r job01
#sleep 30
#mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i2-nl-shg        -J job02 -C out_job02_shg -I $SAVEDIR
#sleep 3
#mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i9-nl-fourier2   -J job02 -C out_job02_shg -I $SAVEDIR
#sleep 3
#rm -r job02
#sleep 30
#mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i3-nl-shg        -J job03 -C out_job03_shg -I $SAVEDIR
#sleep 3
#mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i9-nl-fourier2   -J job03 -C out_job03_shg -I $SAVEDIR
#sleep 3
#rm -r job03
#sleep 30
#mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i4-nl-shg        -J job04 -C out_job04_shg -I $SAVEDIR
#sleep 3
#mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i9-nl-fourier2   -J job04 -C out_job04_shg -I $SAVEDIR
#sleep 3
#rm -r job04
#sleep 30
#mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i5-nl-shg        -J job05 -C out_job05_shg -I $SAVEDIR
#sleep 3
#mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i9-nl-fourier2   -J job05 -C out_job05_shg -I $SAVEDIR
#sleep 3
#rm -r job05
#sleep 30
#mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i6-nl-shg        -J job06 -C out_job06_shg -I $SAVEDIR
#sleep 3
#mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i9-nl-fourier2   -J job06 -C out_job06_shg -I $SAVEDIR
#sleep 3
#rm -r job06
#sleep 30
#mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i7-nl-shg        -J job07 -C out_job07_shg -I $SAVEDIR
#sleep 3
#mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i9-nl-fourier2   -J job07 -C out_job07_shg -I $SAVEDIR
#sleep 3
#rm -r job07
#sleep 30
mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i8-nl-shg        -J job08 -C out_job08_shg -I $SAVEDIR
sleep 3
mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i9-nl-fourier2   -J job08 -C out_job08_shg -I $SAVEDIR
sleep 3
rm -r job08
sleep 30
