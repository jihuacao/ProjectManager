ARG CUDAVersion=10.1

# update kernel version
# cuda-dev
# nvidia hpc cuda10.1最高可适用20.9
wget https://developer.download.nvidia.com/hpc-sdk/20.9/nvhpc-20-9_20.9_amd64.deb \
       https://developer.download.nvidia.com/hpc-sdk/20.9/nvhpc-2020_20.9_amd64.deb \
       https://developer.download.nvidia.com/hpc-sdk/20.9/nvhpc-20-9-cuda-multi_20.9_amd64.deb
apt-get install ./nvhpc-20-9_20.9_amd64.deb ./nvhpc-2020_20.9_amd64.deb ./nvhpc-20-9-cuda-multi_20.9_amd64.deb
# Nsight System
dpkg -i /dta/caojihua/DockerContext/NsightSystems-linux-cli-public-2022.5.1.82-3207805.deb
# Nsight Compute
bash /dta/caojihua/DockerContext/nsight-compute-linux-2023.1.0.16-32451174.run
# Nsight Graphics
#dpkg -i /dta/caojihua/DockerContext/
# install TensorRT