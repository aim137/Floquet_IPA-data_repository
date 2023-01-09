#!/bin/bash
#SBATCH --job-name=".thg"
#SBATCH --output=_out_%j
#SBATCH --error=_err_%j
#SBATCH --partition=k2-lowpri
#SBATCH --ntasks=448
#SBATCH --mem-per-cpu=7G
#SBATCH --time=4-00:00:00

module load compilers/gcc/9.3.0
module load mpi/openmpi/4.0.4/gcc-9.3.0+ucx-1.8.0
module load libs/blas/3.8.0/gcc-9.3.0
module load libs/lapack/3.9.0/gcc-9.3.0
module load libs/fftw3_double/3.3.10/gcc-9.3.0+openmpi-4.0.4
module load apps/hdf5_mpi/1.12.2/gcc-9.3.0+openmpi-4.0.4

SAVEDIR="../../"

bins="/users/40274955//SOFTWARE/5YAMBO_DEVEL_FLOQUET/yambo-devel-fl/bin/"

mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i2-nl-thg           -J job02 -C out_job02_thg    -I $SAVEDIR
sleep 3
mpirun -n $SLURM_NTASKS $bins/ypp_nl     -F i4-nl-fourier2      -J job02 -C out_job02_thg    -I $SAVEDIR
sleep 30
rm -r job02
