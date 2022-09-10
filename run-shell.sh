#!/bin/bash

cd "$(dirname $0)"

sudo docker run -it --rm --gpus all \
  -v $(pwd):/app \
  -v root-profile:/root \
  -v conda:/opt/conda/envs \
  -v /dev/shm:/dev/shm \
  textual-inversion bash
