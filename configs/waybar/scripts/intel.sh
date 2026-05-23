#!/bin/bash

usage=$(intel_gpu_top -J -s 1000 2>/dev/null \
  | jq '[.engines[].busy] | add / length' 2>/dev/null)

usage=${usage%.*}

if [ -z "$usage" ]; then
    usage="0"
fi

echo "iGPU ${usage}%"
