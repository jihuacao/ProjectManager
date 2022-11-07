RUN \
echo "clean" \
&& apt -y --purge remove gcc g++ make swig axel wget vim vim-common curl \
@import:../DockerfileModule/aptclean.Dockerfile
@import:../DockerfileModule/condaclean.Dockerfile
@import:../DockerfileModule/pipclean.Dockerfile
&& rm -rf ${DockerContextTarget} \
&& echo "done"