# HPC
# required: gcc、g++、environment-modules gpg
#&& apt -y instal gpg ca-certificates \
#&& now=$(pwd) \
#&& cd /root/DockerCOntext/ \
#&& curl https://developer.download.nvidia.com/hpc-sdk/ubuntu/DEB-GPG-KEY-NVIDIA-HPC-SDK \
#&& cat DEB-GPG-KEY-NVIDIA-HPC-SDK | gpg --dearmor -o /usr/share/keyrings/nvidia-hpcsdk-archive-keyring.gpg \
#&& cd ${now} \
#&& echo 'deb [signed-by=/usr/share/keyrings/nvidia-hpcsdk-archive-keyring.gpg] https://developer.download.nvidia.com/hpc-sdk/ubuntu/amd64 /' | tee /etc/apt/sources.list.d/nvhpc.list
#&& apt -y update \
#&& apt -y install nvhpc-22-11
&& if [ ! -d "/root/DockerContext/nvhpc_2022_2211_Linux_x86_64_cuda_11.8" ]; then wget -c https://developer.download.nvidia.com/hpc-sdk/22.11/nvhpc_2022_2211_Linux_x86_64_cuda_11.8.tar.gz -P /root/DockerContext/ else echo "has"; fi \
&& now=$(pwd) && cd /root/DockerContext \
&& if [ ! -d "nvhpc_2022_2211_Linux_x86_64_cuda_11.8" ]; then tar -xvf nvhpc_2022_2211_Linux_x86_64_cuda_11.8.tar.gz; else echo "has"; fi \
&& NVHPC_SILENT=true NVHPC_INSTALL_DIR=/opt/nvidia/hpc-sdk NVHPC_INSTALL_TYPE=single NVHPC_DEFAULT_CUDA=11.8 nvhpc_2022_2211_Linux_x86_64_cuda_11.8/install \
&& NVARCH=`uname -s`_`uname -m` \
&& echo "module load /opt/nvidia/hpc-sdk/modulefiles/nvhpc/22.11" >> ~/.bashrc \
#&& ln -sf /opt/nvidia/hpc-sdk/${NVARCH}/22.7/cuda /usr/local/cuda \
#&& echo "update bashrc" \
#&& echo "echo \"Y\" | unminimize" >> ~/.bashrc \
#&& echo "NVARCH=`uname -s`_`uname -m`; export NVARCH" >> ~/.bashrc \
#&& echo "NVCOMPILERS=/opt/nvidia/hpc_sdk; export NVCOMPILERS" >> ~/.bashrc \
#&& echo "MANPATH=$MANPATH:$NVCOMPILERS/$NVARCH/22.7/compilers/man; export MANPATH" >> ~/.bashrc \
#&& echo "export CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda" >> ~/.bashrc \
#&& echo "export PATH=/opt/nvidia/hpc-sdk/${NVARCH}/22.7/compilers/bin:\${PATH}" >> ~/.bashrc \
#&& echo "export PATH=/opt/nvidia/hpc-sdk/${NVARCH}/22.7/compilers/bin/tools:\${PATH}" >> ~/.bashrc \
#&& echo "export PATH=/opt/nvidia/hpc-sdk/${NVARCH}/22.7/compilers/share/llvm/bin:\${PATH}" >> ~/.bashrc \
#&& echo "export PATH=/opt/nvidia/hpc-sdk/${NVARCH}/22.7/compilers/bin/rcfiles:\${PATH}" >> ~/.bashrc \
#&& echo "export PATH=/opt/nvidia/hpc-sdk/${NVARCH}/22.7/compilers/extras/qd/bin:\${PATH}" >> ~/.bashrc \
#&& echo "export PATH=/opt/nvidia/hpc-sdk/${NVARCH}/22.7/profilers/Nsight_Compute:\${PATH}" >> ~/.bashrc \
#&& echo "export PATH=/opt/nvidia/hpc-sdk/${NVARCH}/22.7/profilers/Nsight_System:\${PATH}" >> ~/.bashrc \
#&& echo "export PATH=/opt/nvidia/hpc-sdk/${NVARCH}/22.7/comm_libs/mpi/bin:\${PATH}" >> ~/.bashrc \
#&& echo "export PATH=/opt/nvidia/hpc-sdk/${NVARCH}/22.7/comm_libs/nvshmem/bin:\${PATH}" >> ~/.bashrc \
#&& echo "export PATH=/usr/local/cuda/bin:\${PATH}" >> ~/.bashrc \
#&& echo "export LD_LIBRARY_PATH=/opt/nvidia/hpc-sdk/${NVARCH}/22.7/compilers/lib:\${LD_LIBRARY_PATH}" >> ~/.bashrc \
#&& echo "export LD_LIBRARY_PATH=/opt/nvidia/hpc-sdk/${NVARCH}/22.7/compilers/extras/qd/lib:\${LD_LIBRARY_PATH}" >> ~/.bashrc \
#&& echo "export LD_LIBRARY_PATH=/opt/nvidia/hpc-sdk/${NVARCH}/22.7/comm_libs/nccl/lib:\${LD_LIBRARY_PATH}" >> ~/.bashrc \
#&& echo "export LD_LIBRARY_PATH=/opt/nvidia/hpc-sdk/${NVARCH}/22.7/comm_libs/mpi/lib:\${LD_LIBRARY_PATH}" >> ~/.bashrc \
#&& echo "export LD_LIBRARY_PATH=/opt/nvidia/hpc-sdk/${NVARCH}/22.7/comm_libs/latest/ompi/lib:\${LD_LIBRARY_PATH}" >> ~/.bashrc \
#&& echo "export LD_LIBRARY_PATH=/opt/nvidia/hpc-sdk/${NVARCH}/22.7/comm_libs/latest/ucc/lib:\${LD_LIBRARY_PATH}" >> ~/.bashrc \
#&& echo "export LD_LIBRARY_PATH=/opt/nvidia/hpc-sdk/${NVARCH}/22.7/comm_libs/latest/ucx/lib:\${LD_LIBRARY_PATH}" >> ~/.bashrc \
#&& echo "export LD_LIBRARY_PATH=/opt/nvidia/hpc-sdk/${NVARCH}/22.7/comm_libs/latest/sharp/lib:\${LD_LIBRARY_PATH}" >> ~/.bashrc \
#&& echo "export LD_LIBRARY_PATH=/opt/nvidia/hpc-sdk/${NVARCH}/22.7/comm_libs/latest/hcoll/lib64:\${LD_LIBRARY_PATH}" >> ~/.bashrc \
#&& echo "export LD_LIBRARY_PATH=/opt/nvidia/hpc-sdk/${NVARCH}/22.7/comm_libs/latest/nccl_rdma_sharp_plugin/lib/:\${LD_LIBRARY_PATH}" >> ~/.bashrc \
#&& echo "export LD_LIBRARY_PATH=/opt/nvidia/hpc-sdk/${NVARCH}/22.7/comm_libs/nvshmem/lib:\${LD_LIBRARY_PATH}" >> ~/.bashrc \
#&& echo "export LD_LIBRARY_PATH=/opt/nvidia/hpc-sdk/${NVARCH}/22.7/math_libs/lib64:\${LD_LIBRARY_PATH}" >> ~/.bashrc \
#&& echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:\${LD_LIBRARY_PATH}" >> ~/.bashrc \
#&& echo "CUBLAS_LIB_PATH=/opt/nvidia/hpc-sdk/${NVARCH}/22.7/math_libs/lib64; export CUBLAS_LIB_PATH" >> ~/.bashrc \
#&& echo "CUBLAS_INCLUDE_PATH=/opt/nvidia/hpc-sdk/${NVARCH}/22.7/math_libs/include; export CUBLAS_INCLUDE_PATH" >> ~/.bashrc \
#&& echo "CUDA_PATH=/usr/local/cuda; export CUDA_PATH" >> ~/.bashrc \
#&& echo "update bashrc done" \
&& cd ${now} \
