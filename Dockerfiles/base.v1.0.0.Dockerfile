# syntax=docker/dockerfile:1.2
FROM pytorch_yolov5:v4
#ARG PYTORCH="1.9.0"
#ARG CUDA="10.1"
#ARG CUDNN="7"
#
#FROM pytorch/pytorch:${PYTORCH}-cuda${CUDA}-cudnn${CUDNN}-runtime
ENV TorckVersion=1.8.0