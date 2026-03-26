#!/bin/bash
K_VALUES=(10 25 50 75 100 1000 10000)

echo "========================================="
echo "  XGBoost Training Batch Processing"
echo "========================================="

echo "----- Training: adult (baseline) -----"
python main.py train \
    --dataset data/adult.data \
    --model_name adult_xgb \
    --model_type xgboost

for k in "${K_VALUES[@]}"; do
    echo "----- Training: k = ${k} -----"
    python main.py train \
        --dataset results/anonymized_data_k${k}.csv \
        --model_name anonymized_data_k${k}_xgb \
        --model_type xgboost
done
