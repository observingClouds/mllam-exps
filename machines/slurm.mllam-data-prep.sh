#!/bin/bash -l
#SBATCH --job-name=mllam-data-prep
#SBATCH --time=5:00:00
#SBATCH --ntasks=1
#SBATCH --gpus=1
#SBATCH --account=cu_0003
#SBATCH --output=/dcai/users/%u/logs/neurallam.%j.log
#SBATCH --error=/dcai/users/%u/logs/neurallam.%j.log

echo "Started slurm job $SLURM_JOB_ID"

source machines/environment.sh

# Export for stability
export OMPI_MCA_coll_hcoll_enable=0

echo "Using venv in ${MLLAM_VENV_PATH}"

# source the virtual environment so that the python script can be run
source ${MLLAM_VENV_PATH}/bin/activate

srun -ul python -m mllam_data_prep "$@"
