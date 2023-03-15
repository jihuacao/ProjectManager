RUN \
--mount=type=cache,target=/root/DockerContext,id=DockerContext \
echo "install action" \
@import:../DockerfileModule/aptupdate.Dockerfile
@import:../DockerfileModule/installopencv.Dockerfile
@import:../DockerfileModule/installpyscilib.Dockerfile
@import:../DockerfileModule/installpywebserlib.Dockerfile
@import:../DockerfileModule/installmmlab.Dockerfile
&& pip install nbformat==5.7.3 \
&& pip install cdflib==0.4.9 \
&& pip install h5py==3.8.0 \
&& pip install shapely==2.0.0 \
@import:../DockerfileModule/installffmpeg.Dockerfile
@import:../DockerfileModule/aptclean.Dockerfile
@import:../DockerfileModule/pipclean.Dockerfile
&& echo "done"