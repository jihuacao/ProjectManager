# openssh-server
## 安装ssh
ARG DockerContextTarget=/root/DockerContext
RUN --mount=type=bind,target=/root/DockerContext,source=DockerContext,rw \
echo "generate dev env" \
@import:../DockerfileModule/aptupdate.Dockerfile
@import:../DockerfileModule/installsshser.Dockerfile
@import:../DockerfileModule/installvscodeser.Dockerfile
@import:../DockerfileModule/installnormaldevtool.Dockerfile
@import:../DockerfileModule/installnvtop.Dockerfile
@import:../DockerfileModule/aptclean.Dockerfile
#@import:../DockerfileModule/condaclean.Dockerfile
#@import:../DockerfileModule/pipclean.Dockerfile
&& echo "done"
