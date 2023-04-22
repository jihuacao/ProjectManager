ARG PythonVersion=3.9.12
ARG PythonLink=/usr/bin/python39
ARG CondaRoot=/usr/local/miniconda3

RUN --mount=type=bind,target=/root/DockerContext,source=DockerContext,rw \
echo "install conda" \
@import:../