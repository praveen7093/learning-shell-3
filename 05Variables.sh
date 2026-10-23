#!/bin/bash

START_TIME=$(date +%s)

echo "script stated execution at : $START_TIME"
sleep 10


END_TIME=$(date +%s)
echo "Script completed at: $END_TIME"

TOTAL_TIME=$((END_TIME - START_TIME))
echo "Total time for execution: $TOTAL_TIME seconds"