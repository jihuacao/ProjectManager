# : 安装cuda开发集cu102
ARG Download
ARG ToolkitName=cuda_10.1.105_418.39_linux.run
ARG CUDAToolkit=https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/${ToolkitName}
ARG ToolkitPatch1=cuda_10.1.168_418.67_linux.run
ARG CUDAPatch1=https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/${ToolkitPatch1}
ARG ToolkitPatch2=cuda_10.1.243_418.87.00_linux.run
#wget https://developer.download.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.243_418.87.00_linux.run
ARG CUDAPatch2=https://developer.download.nvidia.com/compute/cuda/10.1/Prod/local_installers/${ToolkitPatch2}
RUN --mount=type=bind,target=/root/DockerContext,source=DockerContext,rw \
echo "generate cuda env" \
&& echo "install cudatoolkit" \
&& cd ${DockerContextTarget} \
#&& wget -c ${CUDAToolkit} \
#&& echo "download done" \
#&& chmod +x ${DockerContextTarget}/${ToolkitName} \
#&& ${DockerContextTarget}/${ToolkitName} --toolkit --samples --silent \
#&& echo "install main done" \
#&& wget -c ${CUDAPatch1} \
#&& echo "download patch1 done" \
#&& chmod +x ${DockerContextTarget}/${ToolkitPatch1} \
#&& ${DockerContextTarget}/${ToolkitPatch1} --silent \
#&& echo "install patch1 done" \
&& wget -c ${CUDAPatch2} \
&& echo "download update2 done" \
&& chmod +x ${DockerContextTarget}/${ToolkitPatch2} \
&& ${DockerContextTarget}/${ToolkitPatch2} --silent --toolkit \
&& echo "install update2 done" \
&& echo 'PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc \
&& echo "install cudnn and nccl" \
&& wget -c https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-keyring_1.0-1_all.deb \
&& dpkg -i cuda-keyring_1.0-1_all.deb \
&& apt-get update \
&& apt -y --allow-change-held-packages install libnccl2 libnccl-dev \
&& echo "install cudnn and nccl done"
