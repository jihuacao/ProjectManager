RUN \
--mount=type=bind,target=/root/DockerContext,source=DockerContext,rw \
echo "system_fix" \
@import:../DockerfileModule/aptupdatesource.Dockerfile
@import:../DockerfileModule/aptupdate.Dockerfile
@import:../DockerfileModule/fixtimeubuntu1804.Dockerfile
@import:../DockerfileModule/ubuntufixchinese.Dockerfile
@import:../DockerfileModule/aptclean.Dockerfile
&& echo "done"