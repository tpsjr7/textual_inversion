FROM continuumio/miniconda3:4.12.0

RUN mkdir /app
COPY environment.yaml /app
WORKDIR /app
RUN conda env create -f environment.yaml

RUN apt-get update && apt install fonts-dejavu-core rsync -y && apt-get clean

COPY evaluation/ /app/evaluation
COPY ldm/ /app/ldm

COPY *.py /app/
SHELL ["/bin/bash", "-ceuxo", "pipefail"]

RUN conda init bash \
    && source /root/.bashrc \
    && conda activate ldm \
    && pip install \
      -e git+https://github.com/CompVis/taming-transformers.git@24268930bf1dce879235a7fddd0b2355b84d7ea6#egg=taming-transformers \
      -e git+https://github.com/openai/CLIP.git@d50d76daa670286dd6cacf3bcd80b5e4823fc8e1#egg=clip \
      -e .

COPY scripts/ /app/scripts
COPY *.sh /app/
COPY configs/ /app/configs


