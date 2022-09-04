# syntax=docker/dockerfile:1.2

ARG BaseSystem=ubuntu \
BaseSystemTag=18.04 \
CUDAVersion=10.2 \
CUDNNVersion=7 \
TorckVersion=1.8.1 \
TFVersion=1.15 \
PythonVersion=3.9.12

FROM ${BaseSystem}:${BaseSystemTag}

RUN --mount=type=bind,target=/root/DockerContext,source=DockerContext,rw
ENV DockerContextSource=DockerContext
ENV DockerContextTarget=/root/DockerContext

SHELL ["/bin/bash", "--login", "-c"]
#FROM nvidia/cuda:$CUDAVersion-cudnn$CUDNNVersion-devel-$BaseSystem
#FROM pytorch_yolov5:v4
#ARG PYTORCH="1.9.0"
#ARG CUDA="10.1"
#ARG CUDNN="7"
#
#FROM pytorch/pytorch:${PYTORCH}-cuda${CUDA}-cudnn${CUDNN}-runtime