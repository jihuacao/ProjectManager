# install cpp dev
# install boost-采用编译安装
&& wget -c ${BoostLink} -P ${BoostSavePath} \
&& tar -xvf ${BoostFile} \
&& cd ${BoostDir} \
&& ./bootsra
# install tensorrt
## install cuda dev
## install cublas
## install cudnn
&& wget -c https://developer.nvidia.com/compute/cudnn/secure/8.6.0/local_installers/10.2/cudnn-local-repo-ubuntu1804-8.6.0.163_1.0-1_amd64.deb \
## compile tensorrt
&& git clone https://github.com/NVIDIA/TensorRT.git /root/TensorRt \
&& cd /root/TensorRT \
&& git submodule update --init --recursive \
# install onnx
&& pip install onnx==1.9.0 \
# install netron服务
&& git clone https://github.com/liguodongiot/netron-flask.git /root/netron-flask \
&& pip install -r /root/netron-flask/requirements.txt
# 编译proxygen
&& apt -y install gperf \
&& apt -y install libiberty-dev \
&& apt -y install liblz4-dev \
&& apt -y install liblzma-dev \
&& apt -y install libsnappy-dev \
&& apt -y install zlib1g-dev \
&& apt -y install binutils-dev \
&& apt -y install libjemalloc-dev \
&& apt -y install libssl-dev \
&& apt -y install pkg-config \
&& apt -y install libunwind8-dev \
&& apt -y install libelf-dev \
&& apt -y install libdwarf-dev \
## 安装folly依赖
&& apt -y install libevent-dev \
&& apt -y install libghc-double-conversion-dev \
&& apt -y install libgflags2.2 libgflags-dev \
&& apt -y install libgoogle-glog-dev \
&& apt -y install protobuf-compiler libprotobuf-dev \
## 安装fizz依赖
&& apt -y install libsodium-dev \