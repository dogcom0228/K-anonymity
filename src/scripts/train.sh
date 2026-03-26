#!/bin/bash
K_VALUES=(10 25 50 75 100 1000 10000)
EPOCHS=50
BATCH_SIZE=512
LR=0.0003
LOSS_TYPE=weighted_bce

echo "========================================="
echo "  Model Training Batch Processing"
echo "========================================="

# baseline
echo "----- Training: adult (baseline) -----"
python main.py train \
    --dataset data/adult.data \
    --model_name adult \
    --epochs ${EPOCHS} --batch_size ${BATCH_SIZE} --lr ${LR} \
    --loss_type ${LOSS_TYPE}

# k-anonymity variants
for k in "${K_VALUES[@]}"; do
    echo "----- Training: k = ${k} -----"
    python main.py train \
        --dataset results/anonymized_data_k${k}.csv \
        --model_name anonymized_data_k${k} \
        --epochs ${EPOCHS} --batch_size ${BATCH_SIZE} --lr ${LR} \
        --loss_type ${LOSS_TYPE}
done
