#!/bin/bash

source /root/.bashrc
conda activate ldm
export CUDA_VISIBLE_DEVICES=0
nvidia-smi
python main.py --base configs/stable-diffusion/v1-finetune.yaml \
               -t \
               --actual_resume models/sd-v1-4.ckpt \
               -n chattyrun1 \
               --gpus 0, \
               --data_root /app/input \
               --init_word mascot