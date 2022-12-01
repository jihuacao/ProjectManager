RUN \
echo "install shangtai_in_one" \
@import:../DockerfileModule/aptupdate.Dockerfile
@import:../DockerfileModule/fixubuntu1804.Dockerfile
@import:../DockerfileModule/installbasetools.Dockerfile
#@import:../DockerfileModule/installnginxlua.Dockerfile
@import:../DockerfileModule/aptclean.Dockerfile
&& echo "done"