#ARG CondaEnvName=MyEnv
#ARG PythonVersion=3.9.12
#ARG PythonLink=/usr/bin/python39
#ARG CondaRoot=/usr
RUN \
--mount=type=bind,target=/root/DockerContext,source=DockerContext,rw \
echo "ops100" \
@import:../DockerfileModule/aptupdatesource.Dockerfile
@import:../DockerfileModule/aptupdate.Dockerfile
@import:../DockerfileModule/fixtimeubuntu1804.Dockerfile
@import:../DockerfileModule/ubuntufixchinese.Dockerfile
@import:../DockerfileModule/ccppenv.Dockerfile
#@import:../DockerfileModule/fixubuntu1804.Dockerfile
@import:../DockerfileModule/installbasetools.Dockerfile
#@import:../DockerfileModule/generateconda.Dockerfile
#@import:../DockerfileModule/aptclean.Dockerfile
&& echo "done"

#ENV PATH=${CondaRoot}/miniconda/bin:$PATH
#
#RUN \
#--mount=type=cache,target=/root/DockerContext,id=DockerContext \
#echo "config ops100 dep" \
#@import:../DockerfileModule/generatecondaenv.Dockerfile
#&& echo 'end'
#
#SHELL ["conda", "run", "-n", "MyEnv", "/bin/bash", "-c"]
#
#RUN \
#--mount=type=cache,target=/root/DockerContext,id=DockerContext \
#echo "install conda dep" \
#&& pip install --upgrade pip \
#@import:../DockerfileModule/aptupdate.Dockerfile
#@import:../DockerfileModule/installcondacudaops.Dockerfile
#@import:../DockerfileModule/installpywebserlib.Dockerfile
#@import:../DockerfileModule/installpyscilib.Dockerfile
#@import:../DockerfileModule/installpypytorch181-cu102.Dockerfile
#@import:../DockerfileModule/condaclean.Dockerfile
#@import:../DockerfileModule/aptclean.Dockerfile
#@import:../DockerfileModule/pipclean.Dockerfile
#&& echo "done"