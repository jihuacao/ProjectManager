# HPC
# required: gcc、g++、environment-modules gpg
&& now=$(pwd) \
&& cd /root/DockerCOntext/ \
# 方式一:使用debian方式安装，安装完可以通过dpkg 与apt管理，这与官方提供的镜像是一样的
&& apt -y instal gpg ca-certificates \
&& curl https://developer.download.nvidia.com/hpc-sdk/ubuntu/DEB-GPG-KEY-NVIDIA-HPC-SDK \
&& cat DEB-GPG-KEY-NVIDIA-HPC-SDK | gpg --dearmor -o /usr/share/keyrings/nvidia-hpcsdk-archive-keyring.gpg \
&& echo 'deb [signed-by=/usr/share/keyrings/nvidia-hpcsdk-archive-keyring.gpg] https://developer.download.nvidia.com/hpc-sdk/ubuntu/amd64 /' | tee /etc/apt/sources.list.d/nvhpc.list \
&& cd ${now} \
&& apt -y update \
&& apt -y install nvhpc-22-11 \
## 方式二:离线安装，用于访问不到nvidia的服务器，没加入到dpkg的包管理中
#&& if [ ! -d "/root/DockerContext/nvhpc_2022_2211_Linux_x86_64_cuda_11.8" ]; then wget -c https://developer.download.nvidia.com/hpc-sdk/22.11/nvhpc_2022_2211_Linux_x86_64_cuda_11.8.tar.gz -P /root/DockerContext/ else echo "has"; fi \
#&& now=$(pwd) && cd /root/DockerContext \
#&& if [ ! -d "nvhpc_2022_2211_Linux_x86_64_cuda_11.8" ]; then tar -xvf nvhpc_2022_2211_Linux_x86_64_cuda_11.8.tar.gz; else echo "has"; fi \
#&& NVHPC_SILENT=true NVHPC_INSTALL_DIR=/opt/nvidia/hpc-sdk NVHPC_INSTALL_TYPE=single NVHPC_DEFAULT_CUDA=11.8 nvhpc_2022_2211_Linux_x86_64_cuda_11.8/install \
#&& NVARCH=`uname -s`_`uname -m` \
#&& ln -sf /opt/nvidia/hpc-sdk/${NVARCH}/22.7/cuda /usr/local/cuda \
#&& cd ${now} \
