#!/bin/bash
K_VALUES=(10 25 50 75 100 1000 10000)

echo "========================================="
echo "  Mondrian k-Anonymity Batch Processing"
echo "========================================="

for k in "${K_VALUES[@]}"; do
    echo ""
    echo "----- k = ${k} -----"
    python main.py mondrian --input_file data/adult.data --k ${k}
done

echo ""
echo "All anonymization tasks completed!"
