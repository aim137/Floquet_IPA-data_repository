#!/bin/bash
#SBATCH --job-name=".thg"
#SBATCH --output=_out_%j
#SBATCH --error=_err_%j
#SBATCH --partition=k2-medpri
#SBATCH --ntasks=448
#SBATCH --mem-per-cpu=7G
#SBATCH --time=09:00:00

module load compilers/gcc/9.3.0
module load mpi/openmpi/4.0.4/gcc-9.3.0+ucx-1.8.0
module load libs/blas/3.8.0/gcc-9.3.0
module load libs/lapack/3.9.0/gcc-9.3.0
module load libs/fftw3_double/3.3.10/gcc-9.3.0+openmpi-4.0.4
module load apps/hdf5_mpi/1.12.2/gcc-9.3.0+openmpi-4.0.4

bins="/users/40274955//SOFTWARE/5YAMBO_DEVEL_FLOQUET/yambo-devel-fl/bin/"
SAVEDIR="../../1THG"

#mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i1-fl-thg           -J job01 -C out_job01_thg    -I $SAVEDIR

#mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i2-fl-thg           -J job02_448cores -C out_job02_448cores_thg    -I $SAVEDIR

#mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i3-fl-thg           -J job03 -C out_job03_thg    -I $SAVEDIR

mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i4-fl-thg           -J job04 -C out_job04_thg    -I $SAVEDIR
