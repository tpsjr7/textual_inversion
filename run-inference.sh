RUN=input2022-09-08T00-04-36_chattyrun1

source /root/.bashrc
conda activate ldm
export CUDA_VISIBLE_DEVICES=0
python scripts/txt2img.py --ddim_eta 0.0 \
                          --n_samples 8 \
                          --n_iter 2 \
                          --scale 10.0 \
                          --ddim_steps 50 \
                          --embedding_path /app/logs/${RUN}/checkpoints/embeddings.pt \
                          --ckpt_path  models/sd-v1-4.ckpt \
                          --prompt "a photo of *"