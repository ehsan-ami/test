#!/bin/bash --login

set -e

# set relevant build variables for horovod
echo $CUDA_HOME
export ENV_PREFIX=$PWD/env
export NCCL_HOME=$ENV_PREFIX
export HOROVOD_CUDA_HOME=$CUDA_HOME
export HOROVOD_NCCL_HOME=$NCCL_HOME
export HOROVOD_GPU_OPERATIONS=NCCL

# request builds for specific framework
export HOROVOD_WITH_TENSORFLOW=1
export HOROVOD_WITH_PYTORCH=1
#export HOROVOD_WITH_MXNET=1

# create the conda environment
conda env create --prefix $ENV_PREFIX --file environment.yml --force
conda activate $ENV_PREFIX
#source postBuild
