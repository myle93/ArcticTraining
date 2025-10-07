#!/bin/bash
#SBATCH --nodelist=workg02
#SBATCH --cpus-per-gpu=4
#SBATCH --mem-per-cpu=128G
#SBATCH --gres=gpu:1

cd /data/stud_agdbs/akzxy/ArcticTraining/ || exit 1
source .venv/bin/activate

cd projects/excot_dpo/

python data_generation/local_verification.py \
    --config-path data_generation/configs/bird_config.yaml \
    --vllm-cot-path output \
    --output-path output_verify
