RUN \
echo "install shangtai_in_one" \
@import:../DockerfileModule/aptupdatesource.Dockerfile
@import:../DockerfileModule/aptupdate.Dockerfile
@import:../DockerfileModule/ccppenv.Dockerfile
@import:../DockerfileModule/fixubuntu1804.Dockerfile
@import:../DockerfileModule/installbasetools.Dockerfile
@import:../DockerfileModule/generateconda.Dockerfile
@import:../DockerfileModule/aptclean.Dockerfile
@import:../DockerfileModule/condaclean.Dockerfile
@import:../DockerfileModule/pipclean.Dockerfile
&& echo "done"

ENV PATH=/root/miniconda/bin:$PATH

RUN \
--mount=type=cache,target=/root/DockerContext,id=DockerContext \
echo "config ops100 dep" \
@import:../DockerfileModule/generatecondaenv.Dockerfile
&& echo 'end'

SHELL ["conda", "run", "-n", "MyEnv", "/bin/bash", "-c"]

RUN \
--mount=type=cache,target=/root/DockerContext,id=DockerContext \
echo "install conda dep" \
&& pip install --upgrade pip \
@import:../DockerfileModule/aptupdate.Dockerfile
@import:../DockerfileModule/installpywebserlib.Dockerfile
@import:../DockerfileModule/installpyscilib.Dockerfile
&& pip install xlrd==2.0.1 \
&& pip install openpyxl==3.0.10 \
&& pip install rsa==4.9 \
#@import:../DockerfileModule/installmysql.Dockerfile
@import:../DockerfileModule/condaclean.Dockerfile
@import:../DockerfileModule/aptclean.Dockerfile
@import:../DockerfileModule/pipclean.Dockerfile
&& echo "done"
