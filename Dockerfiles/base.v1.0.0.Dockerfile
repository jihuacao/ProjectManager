# syntax=docker/dockerfile:1.2
FROM ubuntu:18.04

ARG CUDAVersion=10.2
ARG CUDNNVersion=7
ARG TorckVersion=1.8.1
ARG TFVersion=1.15
ARG PythonVersion=3.9.12
ARG DockerContextSource=DockerContext
ARG DockerContextTarget=/root/DockerContext

RUN --mount=type=bind,target=/root/DockerContext,source=DockerContext,rw

SHELL ["/bin/bash", "--login", "-c"]
#FROM nvidia/cuda:$CUDAVersion-cudnn$CUDNNVersion-devel-$BaseSystem
#FROM pytorch_yolov5:v4
#ARG PYTORCH="1.9.0"
#ARG CUDA="10.1"
#ARG CUDNN="7"
#
#FROM pytorch/pytorch:${PYTORCH}-cuda${CUDA}-cudnn${CUDNN}-runtime