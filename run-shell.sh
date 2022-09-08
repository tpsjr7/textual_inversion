#!/bin/bash

cd "$(dirname $0)"
base_path="$(pwd)"
mkdir -p .cache
mkdir -p outputs
cd "$base_path"
docker run \
  -v ${base_path}/models:/app/models \
  -v ${base_path}/img/input:/app/input \
  -v ${base_path}/run-invert.sh:/app/run-invert.sh \
  -v ${base_path}/run-inference.sh:/app/run-inference.sh \
  -v ${base_path}/.cache:/root/.cache \
  -v /mnt/c/ted/code/img-gen/sd-v1-4.ckpt:/app/models/sd-v1-4.ckpt \
  -v ${base_path}/logs:/app/logs \
  -v ${base_path}/outputs:/app/outputs \
  --gpus 1 -it --rm ted/textinv bash

