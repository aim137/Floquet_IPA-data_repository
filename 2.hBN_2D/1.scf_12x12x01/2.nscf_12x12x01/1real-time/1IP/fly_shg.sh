#!/bin/bash
#SBATCH --job-name=".shg"
#SBATCH --output=_out_%j
#SBATCH --error=_err_%j
#SBATCH --partition=main
#SBATCH --ntasks=112
#SBATCH --time=12:00:00

bins="/s/martin/SOFTWARE/5YAMBO_DEVEL_FLOQUET/yambo-devel-floquet/bin/"
bypp="/s/martin/SOFTWARE/3YAMBO_MASTER/yambo-devel-2prec/bin/"
SAVEDIR="../"

#mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i1-nl-firstorder -J job01 -C out_job01_firstorder -I $SAVEDIR
#sleep 3
#mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i2-nl-fourier    -J job01 -C out_job01_firstorder -I $SAVEDIR
#sleep 3
#mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i5-nl-fourier    -J job01 -C out_job03_firstorder -I $SAVEDIR
#sleep 3
mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i3-nl-shg             -J job02 -C out_job02_shg -I $SAVEDIR
sleep 3
mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i4-nl-fourier2        -J job02 -C out_job02_shg -I $SAVEDIR
sleep 3
mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i4-nl-fourier2-hd_b   -J job02 -C out_job02_shg_b -I $SAVEDIR
sleep 3
mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i4-nl-fourier2-hd_c   -J job02 -C out_job02_shg_c -I $SAVEDIR
sleep 3
mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i4-nl-fourier2-hd_d   -J job02 -C out_job02_shg_d -I $SAVEDIR
sleep 30
rm -r job02
#sleep 3
#mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i6-nl-shg             -J job04 -C out_job04_shg -I $SAVEDIR
#sleep 3
#mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i4-nl-fourier2        -J job04 -C out_job04_shg -I $SAVEDIR
#sleep 3 
#mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i4-nl-fourier2-ld_b   -J job04 -C out_job04_shg_b -I $SAVEDIR
#sleep 3
#mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i4-nl-fourier2-ld_c   -J job04 -C out_job04_shg_c -I $SAVEDIR
#sleep 3
#mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i4-nl-fourier2-ld_d   -J job04 -C out_job04_shg_d -I $SAVEDIR
#sleep 3
#mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i4-nl-fourier2-ld_e   -J job04 -C out_job04_shg_e -I $SAVEDIR
#sleep 30
#rm -r job04
