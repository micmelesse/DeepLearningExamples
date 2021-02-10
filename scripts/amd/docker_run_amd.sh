alias drun='sudo docker run -it --rm --network=host --device=/dev/kfd --device=/dev/dri --ipc=host --shm-size 16G --group-add video --cap-add=SYS_PTRACE --security-opt seccomp=unconfined'
#  "-v $HOME/dockerx:/dockerx -v /data:/data -v /nfs_megatron:/nfs_megatron"
WORK_DIR='/workspace/bert'

drun -w $WORK_DIR \
    -v $HOME/dockerx/DeepLearningExamples/PyTorch/LanguageModeling/BERT:/workspace/bert \
    -v $HOME/dockerx/DeepLearningExamples/scripts/amd:/workspace/bert/scripts/amd \
    rocm/pytorch:rocm4.0_ubuntu18.04_py3.6_pytorch
