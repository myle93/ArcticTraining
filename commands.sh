!git clone https://github.com/snowflakedb/ArcticTraining.git
pip install .
pip install -r requirements.txt 


wget https://bird-bench.oss-cn-beijing.aliyuncs.com/dev.zip
unzip dev.zip
unzip dev_20240627/dev_databases.zip

wget https://bird-bench.oss-cn-beijing.aliyuncs.com/train.zip
unzip train.zip
unzip train/train_databases.zip

pip install gdown
gdown 1403EGqzIDoHMdQF4c9Bkyl7dZLZ5Wt6J


python data_generation/data_generation.py \
    --config-path data_generation/configs/bird_config.yaml \
    --type vllm \
    --model-name Qwen/Qwen2-0.5B-Instruct \
    --vllm-output-path /content/ArcticTraining/projects/excot_dpo/data \
    --tp-size 1 (NUM_OF_GPUs = tensor_parallel_size)

python data_generation/data_generation.py \
    --config-path data_generation/configs/spider_config.yaml \
    --type vllm \
    --model-name Qwen/Qwen2-0.5B-Instruct \
    --vllm-output-path /content/ArcticTraining/projects/excot_dpo/data \
    --tp-size 1

set data_generation.py swap_space: 4 (GPU_LEISTUNG)
