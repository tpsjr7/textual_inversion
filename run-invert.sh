#!/bin/bash

set -x
source /root/.bashrc
conda activate ldm
nvidia-smi

if [ "$1" != "" ] ; then
  gpus="$1"
else
  gpus="0,"
fi

if [ "$2" = "" ] ; then
  echo "usage: $0 <gpus> <init_word>"
  exit 1
fi
python main.py --base configs/stable-diffusion/v1-finetune-lowmem.yaml \
               -t \
               --actual_resume models/ldm/stable-diffusion-v1/model.ckpt \
               -n textinvertrun \
               --gpus ${gpus} \
               --data_root /app/img/inputimg \
               --init_word "$2"
