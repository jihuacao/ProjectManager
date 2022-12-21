# syntax=docker/dockerfile:1.2
FROM nvidia/cuda:10.1-runtime-ubuntu18.04

ARG DockerContextSource=DockerContext
ARG DockerContextTarget=/root/DockerContext

SHELL ["/bin/bash", "--login", "-c"]

RUN rm /etc/apt/sources.list.d/cuda.list /etc/apt/sources.list.d/nvidia-ml.list