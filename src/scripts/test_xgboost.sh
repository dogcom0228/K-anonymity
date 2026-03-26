#!/bin/bash
K_VALUES=(10 25 50 75 100 1000 10000)

echo "========================================="
echo "  XGBoost Testing Batch Processing"
echo "========================================="

echo "----- Testing: adult (baseline) -----"
python main.py test \
    --model_path models/adult_xgb.pkl \
    --test_data data/adult.test \
    --batch_size 256

for k in "${K_VALUES[@]}"; do
    echo "----- Testing: k = ${k} -----"
    python main.py test \
        --model_path models/anonymized_data_k${k}_xgb.pkl \
        --test_data data/adult.test \
        --batch_size 256
done
