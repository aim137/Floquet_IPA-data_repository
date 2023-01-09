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

mpirun -n 28            $bins/yambo_fl   -F i1-nl-firstorder -J job01 -C out_job01_firstorder -I $SAVEDIR
sleep 3
mpirun -n 28            $bypp/ypp_nl     -F i2-nl-fourier    -J job01 -C out_job01_firstorder -I $SAVEDIR
sleep 3
mpirun -n 28            $bypp/ypp_nl     -F i5-nl-fourier    -J job01 -C out_job03_firstorder -I $SAVEDIR
