RUN=input2022-09-10T02-05-28_chattyrun1

source /root/.bashrc
conda activate ldm
export CUDA_VISIBLE_DEVICES=0
python scripts/txt2img.py --ddim_eta 0.0 \
                          --n_samples 8 \
                          --n_iter 8 \
                          --scale 10.0 \
                          --ddim_steps 50 \
                          --embedding_path /app/logs/${RUN}/checkpoints/embeddings.pt \
                          --ckpt_path  models/ldm/stable-diffusion-v1/model.ckpt \
                          --config /app/logs/${RUN}/configs/*project.yaml \
                          --prompt "a photo of * using a laptop"
