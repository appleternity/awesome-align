DIR="/home/t-chuang/workspace/awesome-align"
DATA_FILE="${DIR}/src/parallel_dev.txt"
MODEL_NAME_OR_PATH="${DIR}/utterance"
OUTPUT_FILE="${DIR}/output_utterance.txt"

#CUDA_VISIBLE_DEVICES=0 awesome-align \
CUDA_VISIBLE_DEVICES=0 python $DIR/run_align.py \
    --output_file=$OUTPUT_FILE \
    --model_name_or_path=$MODEL_NAME_OR_PATH \
    --data_file=$DATA_FILE \
    --extraction 'softmax' \
    --batch_size 32 \
