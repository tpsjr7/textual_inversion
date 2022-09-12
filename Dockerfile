FROM continuumio/miniconda3:4.12.0

SHELL ["/bin/bash", "-ceuxo", "pipefail"]
RUN mkdir /app
WORKDIR /app
RUN apt-get update && apt install fonts-dejavu-core rsync vim && apt-get clean

