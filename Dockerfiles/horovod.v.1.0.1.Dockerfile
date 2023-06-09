RUN \
--mount=type=bind,target=/root/DockerContext,source=DockerContext,rw \
echo "install for horovod" \
@import:../DockerfileModule/aptupdate.Dockerfile
&& echo "config mpi environment" \
&& apt -y install openmpi-bin openmpi-doc libopenmpi-dev \
&& echo "install ompi" \
&& HOROVOD_WITH_PYTORCH=1 HOROVOD_GPU_OPERATIONS=NCCL HOROVOD_WITHOUT_GLOO=1 HOROVOD_WITH_MPI=1 pip install horovod==0.19.5 \
@import:../DockerfileModule/aptclean.Dockerfile
@import:../DockerfileModule/pipclean.Dockerfile
&& echo "done"
