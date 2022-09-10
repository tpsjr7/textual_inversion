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
python main.py --base configs/stable-diffusion/v1-finetune.yaml \
               -t \
               --actual_resume models/ldm/stable-diffusion-v1/model.ckpt \
               -n chattyrun1 \
               --gpus ${gpus} \
               --data_root /app/img/input \
               --init_word mascot