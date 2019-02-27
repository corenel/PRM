#!/usr/bin/env bash

GLOW_DATA_ROOT=${GLOW_DATA_ROOT:-/meida/data1/}
GLOW_RESULT_DIR=${GLOW_RESULT_DIR:-/media/data1/glow}

docker run --rm -it --init \
  --runtime=nvidia \
  --ipc=host \
  --network=host \
  --volume=$PWD:/app/code \
  --volume=${GLOW_DATA_ROOT}:/app/PRM-pytorch/demo/datasets \
  --volume=${GLOW_RESULT_DIR}:/app/result \
  --volume=$HOME/.torch:/root/.torch \
  --volume=$PWD/.ssh:/root/.ssh \
  -e LC_ALL=C.UTF-8 \
  -e LANG=C.UTF-8 \
  -e CUDA_VISIBLE_DEVICES=${1} \
  corenel/pytorch:cu90-py36-pytorch1.0.1-prm "${@:2}"

