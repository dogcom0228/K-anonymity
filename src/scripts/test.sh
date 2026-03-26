#!/bin/bash
K_VALUES=(10 25 50 75 100 1000 10000)
TEST_DATA="data/adult.test"
BATCH_SIZE=256

echo "========================================="
echo "  Model Testing Batch Processing"
echo "========================================="

# baseline
echo "----- Testing: adult (baseline) -----"
python main.py test \
    --model_path models/adult.pt \
    --test_data ${TEST_DATA} --batch_size ${BATCH_SIZE}

# 各 k 值
for k in "${K_VALUES[@]}"; do
    echo "----- Testing: k = ${k} -----"
    python main.py test \
        --model_path models/anonymized_data_k${k}.pt \
        --test_data ${TEST_DATA} --batch_size ${BATCH_SIZE}
done
