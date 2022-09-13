#!/bin/bash

cd /app
mkdir -p img/inputimg

if ! conda env list | grep ldm ; then
    conda env create -f environment.yaml
    echo "conda activate ldm" >> /root/.bashrc
    conda /root/.bashrc
    pip install \
          -e git+https://github.com/CompVis/taming-transformers.git@24268930bf1dce879235a7fddd0b2355b84d7ea6#egg=taming-transformers \
          -e git+https://github.com/openai/CLIP.git@d50d76daa670286dd6cacf3bcd80b5e4823fc8e1#egg=clip \
          -e .
fi

function validateDownloadModel() {
    local file=$1
    local path=$2
    local url=$3
    local hash=$4

    echo "checking ${file}..."
    sha256sum --check --status <<< "${hash} ${path}/${file}"
    if [[ $? == "1" ]]; then
        echo "Downloading: ${url} please wait..."
        mkdir -p ${path}
        wget --output-document=${path}/${file} --no-verbose --show-progress --progress=dot:giga ${url}
        echo "saved ${file}"
    else
        echo "${file} is valid!"
    fi
}

validateDownloadModel model.ckpt models/ldm/stable-diffusion-v1 https://www.googleapis.com/storage/v1/b/aai-blog-files/o/sd-v1-4.ckpt?alt=media fe4efff1e174c627256e44ec2991ba279b3816e364b49f9be2abc0b3ff3f8556

./run-invert.sh 0,1 pose