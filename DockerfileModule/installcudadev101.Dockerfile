# 未验证
&& DockerContextTarget=/root/workspace/DockerContext/ \
&& echo "download 10.1" \
&& wget -c https://developer.nvidia.cn/compute/cuda/10.1/Prod/local_installers/cuda_10.1.105_418.39_linux.run -P ${DockerContextTarget} \
&& chmod +x ${DockerContextTarget}/cuda_10.1.105_418.39_linux.run \
&& echo "download 10.1 patch 1" \
&& wget -c https://developer.nvidia.cn/compute/cuda/10.1/Prod/local_installers/cuda_10.1.168_418.67_linux.run -P ${DockerContextTarget} \
&& chmod +x ${DockerContextTarget}/cuda_10.1.168_418.67_linux.run \
&& echo "download 10.1 patch 2" \
&& wget -c https://developer.download.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.243_418.87.00_linux.run -P ${DockerContextTarget} \
&& chmod +x ${DockerContextTarget}/cuda_10.1.243_418.87.00_linux.run \
&& echo "install 10.1" \
&& ${DockerContextTarget}/cuda_10.1.105_418.39_linux.run --toolkit --samples --silent \
&& echo "install 10.1 patch 1" \
&& ${DockerContextTarget}/cuda_10.1.168_418.67_linux.run --silent \
&& echo "install 10.1 patch 2" \
&& ${DockerContextTarget}/cuda_10.1.243_418.87.00_linux.run --silent \
&& echo "install cudnn and nccl" \
&& wget -c https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-keyring_1.0-1_all.deb \
&& dpkg -i cuda-keyring_1.0-1_all.deb \
&& apt-get update \
&& apt -y --allow-change-held-packages install libnccl2=2.13.4-1+cuda10.1 libnccl-dev=2.13.4-1+cuda10.1 \
&& echo "install cudnn and nccl done" \