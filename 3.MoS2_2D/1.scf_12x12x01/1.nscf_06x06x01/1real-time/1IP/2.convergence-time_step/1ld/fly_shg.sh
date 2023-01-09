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

mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i3-nl-shg_00       -J job02_00 -C out_job02_shg_00 -I $SAVEDIR
sleep 3
mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i4-nl-fourier2     -J job02_00 -C out_job02_shg_00 -I $SAVEDIR
sleep 30
rm -r job02_00
sleep 3
mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i3-nl-shg_01       -J job02_01 -C out_job02_shg_01 -I $SAVEDIR
sleep 3
mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i4-nl-fourier2     -J job02_01 -C out_job02_shg_01 -I $SAVEDIR
sleep 30
rm -r job02_01
sleep 3
mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i3-nl-shg_02       -J job02_02 -C out_job02_shg_02 -I $SAVEDIR
sleep 3
mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i4-nl-fourier2     -J job02_02 -C out_job02_shg_02 -I $SAVEDIR
sleep 30
rm -r job02_02
sleep 3
mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i3-nl-shg_03       -J job02_03 -C out_job02_shg_03 -I $SAVEDIR
sleep 3
mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i4-nl-fourier2     -J job02_03 -C out_job02_shg_03 -I $SAVEDIR
sleep 30
rm -r job02_03
sleep 3
mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i3-nl-shg_04       -J job02_04 -C out_job02_shg_04 -I $SAVEDIR
sleep 3
mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i4-nl-fourier2     -J job02_04 -C out_job02_shg_04 -I $SAVEDIR
sleep 30
rm -r job02_04
sleep 3
mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i3-nl-shg_05       -J job02_05 -C out_job02_shg_05 -I $SAVEDIR
sleep 3
mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i4-nl-fourier2     -J job02_05 -C out_job02_shg_05 -I $SAVEDIR
sleep 30
rm -r job02_05
sleep 3
mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i3-nl-shg_06       -J job02_06 -C out_job02_shg_06 -I $SAVEDIR
sleep 3
mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i4-nl-fourier2     -J job02_06 -C out_job02_shg_06 -I $SAVEDIR
sleep 30
rm -r job02_06
sleep 3
mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i3-nl-shg_07       -J job02_07 -C out_job02_shg_07 -I $SAVEDIR
sleep 3
mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i4-nl-fourier2     -J job02_07 -C out_job02_shg_07 -I $SAVEDIR
sleep 30
rm -r job02_07
sleep 3
