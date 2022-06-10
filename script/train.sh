DIR="/home/czh5679/workspace_02/awesome-align"
DATA_DIR="/home/czh5679/workspace_02/image_captioning/data/mention-caption-alignment"
TRAIN_FILE="${DATA_DIR}/train.src-tgt"
EVAL_FILE=/path/to/eval/file
OUTPUT_DIR="${DIR}/scibert-alignment"
MODEL_NAME_OR_PATH="allenai/scibert_scivocab_uncased"

CUDA_VISIBLE_DEVICES=1 awesome-train \
    --output_dir=$OUTPUT_DIR \
    --model_name_or_path="${MODEL_NAME_OR_PATH}" \
    --extraction 'softmax' \
    --do_train \
    --train_tlm \
    --train_so \
    --train_data_file=$TRAIN_FILE \
    --per_gpu_train_batch_size 4 \
    --gradient_accumulation_steps 8 \
    --num_train_epochs 5 \
    --learning_rate 2e-5 \
    --save_steps 4000 \
    --max_steps 20000 \
    #--do_eval \
    #--eval_data_file=$EVAL_FILE \

