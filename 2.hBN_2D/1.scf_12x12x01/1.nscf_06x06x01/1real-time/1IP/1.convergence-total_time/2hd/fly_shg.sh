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
datetag=`date +%Y%m%d-%H.%M.%S`

mpirun -n $SLURM_NTASKS $bins/yambo_fl   -F i7-nl-shg        -J job05_$datetag -C out_job05_shg_$datetag -I $SAVEDIR
sleep 3
mpirun -n $SLURM_NTASKS $bypp/ypp_nl     -F i4-nl-fourier2   -J job05_$datetag -C out_job05_shg_$datetag -I $SAVEDIR
