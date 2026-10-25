#!/bin/bash
#SBATCH --job-name=CTRLspinup   # Job name
#SBATCH --mail-type=ALL         # Mail events (NONE, BEGIN, END, FAIL, ALL) 
#SBATCH --nodes=8               # Number of nodes
#SBATCH --ntasks-per-node=36    # How many tasks on each node
#SBATCH --output=mitgcm_%j.log  # Standard output and error log
#SBATCH --partition=ocean_shyj  # name of nodes

### Set  environment###
#source /home/softwares/app/intel2020.sh
source /opt/intel2020/compilers_and_libraries/linux/bin/compilervars.sh intel64
source /opt/intel2020/mkl/bin/mklvars.sh intel64
source /opt/intel2020/impi/2019.8.254/intel64/bin/mpivars.sh

mpirun ./mitsrc 
