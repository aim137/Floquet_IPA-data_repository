#!/bin/bash
#SBATCH --job-name=".thg"
#SBATCH --output=_out_%j
#SBATCH --error=_err_%j
#SBATCH --partition=main
#SBATCH --ntasks=112
#SBATCH --time=12:00:00

bins="/s/martin/SOFTWARE/5YAMBO_DEVEL_FLOQUET/yambo-devel-floquet/bin/"
bypp="/s/martin/SOFTWARE/3YAMBO_MASTER/yambo-devel-2prec/bin/"
SAVEDIR="../../"

mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i1-nl-thg           -J job01 -C out_job01_thg    -I $SAVEDIR
sleep 3
mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i4-nl-fourier2      -J job01 -C out_job01_thg    -I $SAVEDIR
sleep 30
rm -r job01
sleep 3
