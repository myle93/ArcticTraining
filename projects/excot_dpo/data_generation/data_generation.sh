#!/bin/bash

cd /data/stud_agdbs/akzxy/ArcticTraining/
source .venv/bin/activate

python data_generation/data_generation.py \
    --config-path data_generation/configs/bird_config.yaml \
    --type vllm \
    --model-name Qwen/Qwen2.5-32B-Instruct \
    --vllm-output-path output \
    --tp-size 1