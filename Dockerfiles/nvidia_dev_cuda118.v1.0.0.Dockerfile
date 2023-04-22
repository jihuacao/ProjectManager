FROM nvidia/cuda:11.8.0-devel-ubuntu18.04

RUN --mount=type=bind,target=/root/DockerContext,source=DockerContext,rw \
echo "install nvidia HPC" \
@import:../DockerfileModule/aptupdatesource.Dockerfile
@import:../DockerfileModule/aptupdate.Dockerfile
@import:../DockerfileModule/installbasetools_ubuntu.Dockerfile
@import:../DockerfileModule/fixtime_ubuntu.Dockerfile
@import:../DockerfileModule/fixchinese_ubuntu.Dockerfile
@import:../DockerfileModule/ccppenv.Dockerfile
#@import:../DockerfileModule/nvidia-cuda11.8-dev-ubuntu18.04.Dockerfile
#@import:../DockerfileModule/nvidia-hpc-sdk-cuda118-ubuntu.Dockerfile
@import:../DockerfileModule/nvidia-DL-dev-cuda118-ubuntu18.04.Dockerfile
@import:../DockerfileModule/aptclean.Dockerfile
&& echo "done"

ARG CondaEnvName=MyEnv
ARG PythonVersion=3.9.12
ARG PythonLink=/usr/bin/python39
ARG CondaRoot=/usr
RUN --mount=type=bind,target=/root/DockerContext,source=DockerContext,rw \
echo "install conda" \
@import:../DockerfileModule/aptupdate.Dockerfile
@import:../DockerfileModule/generateconda.Dockerfile
@import:../DockerfileModule/aptclean.Dockerfile
&& echo "install conda done"
ENV PATH=${CondaRoot}/miniconda/bin:$PATH
RUN --mount=type=cache,target=/root/DockerContext,id=DockerContext \
echo "generate conda env" \
@import:../DockerfileModule/aptupdate.Dockerfile
@import:../DockerfileModule/generatecondaenv.Dockerfile
@import:../DockerfileModule/aptclean.Dockerfile
&& echo 'generate conda env end'
SHELL ["conda", "run", "-n", "MyEnv", "/bin/bash", "-c"]

RUN --mount=type=cache,target=/root/DockerContext,id=DockerContext \
echo "install conda dep" \
&& pip install --upgrade pip \
@import:../DockerfileModule/installpywebserlib.Dockerfile
@import:../DockerfileModule/installpyscilib.Dockerfile
@import:../DockerfileModule/install-py_dl_env-cuda11.8-ubuntu1804.Dockerfile
@import:../DockerfileModule/aptclean.Dockerfile
@import:../DockerfileModule/pipclean.Dockerfile
&& echo "install conda env dep"