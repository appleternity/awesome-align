#! /bin/bash
DATA_DIR="/home/czh5679/workspace_02/image_captioning/data/new-data-0425"
DIR="/home/czh5679/workspace_02/awesome-align"
GPU="1"

# base cases
VERSION_LIST=( \
    "mention+ocr-caption-alignment" \
    "paragraph+ocr-caption-alignment" \ 
    "ocr-caption-alignment" \ 
)

# context cases
left=(0 0 1 2 1 2)
right=(1 2 0 0 1 2)
for i in ${!left[@]};
do
    VERSION_LIST+=("context-${left[i]}-${right[i]}+ocr-caption-alignment")
done

# show
echo "Working on: ${VERSION_LIST[@]}"

# run
for VERSION in ${VERSION_LIST[@]}
do
    echo
    echo "Current: ${VERSION}"
    MODEL_NAME_OR_PATH="allenai/scibert_scivocab_cased"
    DATA_FILE="${DATA_DIR}/${VERSION}/all.src-tgt"
    OUTPUT_FILE="${DATA_DIR}/${VERSION}/all.align.990"
    
    CUDA_VISIBLE_DEVICES=${GPU} python $DIR/run_align.py \
        --output_file=$OUTPUT_FILE \
        --model_name_or_path=$MODEL_NAME_OR_PATH \
        --data_file=$DATA_FILE \
        --extraction 'softmax' \
        --batch_size 16 \
        --softmax_threshold 0.99
done
