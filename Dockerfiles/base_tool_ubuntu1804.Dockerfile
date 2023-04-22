RUN \
--mount=type=bind,target=/root/DockerContext,source=DockerContext,rw \
echo "base_tool_ubuntu1804" \
@import:../DockerfileModule/aptupdate.Dockerfile
@import:../DockerfileModule/installbasetools_ubuntu1804.Dockerfile
@import:../DockerfileModule/aptclean.Dockerfile
&& echo "base_tool_ubuntu1804 done"