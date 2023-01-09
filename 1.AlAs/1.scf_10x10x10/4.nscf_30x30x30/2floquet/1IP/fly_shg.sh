#!/bin/bash
#SBATCH --job-name=".shg"
#SBATCH --output=_out_%j
#SBATCH --error=_err_%j
#SBATCH --partition=k2-medpri
#SBATCH --ntasks=112
#SBATCH --mem-per-cpu=14G
#SBATCH --time=20:00:00

bins="/users/40274955/SOFTWARE/5YAMBO_DEVEL_FLOQUET/yambo-devel-fl/bin/"
SAVEDIR="../../3nonlinear/"

module load compilers/gcc/9.3.0
module load mpi/openmpi/4.0.4/gcc-9.3.0+ucx-1.8.0
module load libs/blas/3.8.0/gcc-9.3.0
module load libs/lapack/3.9.0/gcc-9.3.0
module load libs/fftw3_double/3.3.10/gcc-9.3.0+openmpi-4.0.4
module load apps/hdf5_mpi/1.12.2/gcc-9.3.0+openmpi-4.0.4

mpirun -np $SLURM_NTASKS $bins/yambo_fl -F i1-fl-shg   -J job01 -C out_job01_shg_ld -I $SAVEDIR
sleep 3
mpirun -np $SLURM_NTASKS $bins/yambo_fl -F i2-fl-shg   -J job02 -C out_job02_shg_hd -I $SAVEDIR
