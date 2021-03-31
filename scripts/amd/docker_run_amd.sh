set -e
alias drun='sudo docker run -it --rm --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --shm-size 16G --group-add video --cap-add=SYS_PTRACE --security-opt seccomp=unconfined'

# VOLUMES="-v $HOME/dockerx:/dockerx -v /data:/data"

VOLUMES="-v $HOME/dockerx/DeepLearningExamples/PyTorch/LanguageModeling/BERT:/workspace/bert \
 -v $HOME/dockerx/DeepLearningExamples/scripts/amd:/workspace/bert/scripts/amd \
 -v /data/NVBERT/data:/data"

WORK_DIR='-w /workspace/bert'

# IMAGE_NAME=rocm/pytorch:rocm4.0_ubuntu18.04_py3.6_pytorch
IMAGE_NAME=rocm/pytorch-private:rocm4.1-pytorch-lamb-gathergrad

CONTAINER_ID=$(drun -d $WORK_DIR $VOLUMES $IMAGE_NAME)
echo "CONTAINER_ID: $CONTAINER_ID"
# docker cp . $CONTAINER_ID:/root/
docker attach $CONTAINER_ID
docker stop $CONTAINER_ID
docker rm $CONTAINER_ID
