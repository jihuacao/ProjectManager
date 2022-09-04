# : 安装cuda开发集cu102
ARG Download
ARG ToolkitName=cuda_10.2.89_440.33.01_linux.run
ARG CUDAToolkit=https://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/${ToolkitName}
ARG ToolkitPatch1=cuda_10.2.1_linux.run
ARG CUDAPatch1=https://developer.download.nvidia.com/compute/cuda/10.2/Prod/patches/1/${ToolkitPatch1}
ARG ToolkitPatch2=cuda_10.2.2_linux.run
ARG CUDAPatch2=https://developer.download.nvidia.com/compute/cuda/10.2/Prod/patches/2/${ToolkitPatch2}
RUN \
echo "generate cuda env" \
&& echo "install cudatoolkit" \
&& cd ${DockerContextTarget} \
&& wget -c -q ${CUDAToolkit} \
&& chmod +x ${DockerContextTarget}/${ToolkitName} \
&& ${DockerContextTarget}/${ToolkitName} --toolkit --samples --silent \
&& wget -c -q ${CUDAPatch1} \
&& chmod +x ${DockerContextTarget}/${ToolkitPatch1} \
&& ${DockerContextTarget}/${ToolkitPatch1} --silent \
&& wget -c -q ${CUDAPatch2} \
&& chmod +x ${DockerContextTarget}/${ToolkitPatch2} \
&& ${DockerContextTarget}/${ToolkitPatch2} --silent \
&& echo 'PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc \
&& echo "install cudnn" \
&& echo "install nccl" \
&& wget -c https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-keyring_1.0-1_all.deb \
&& dpkg -i cuda-keyring_1.0-1_all.deb \
&& apt-get update \
&& apt -y --allow-change-held-packages install libnccl2=2.13.4-1+cuda10.2 libnccl-dev=2.13.4-1+cuda10.2 \
&& echo "done"
