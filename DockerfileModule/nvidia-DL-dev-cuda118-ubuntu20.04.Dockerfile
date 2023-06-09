# TensorRT 8.5
# * depend
#   * cuBLAS 11
# cudnn 8.6
# 如何依赖nvidia hpc sdk安装?apt是如何扫描依赖的？可否手动添加依赖路径
&& now=$(pwd) \
&& cd /root/DockerContext/ \
&& dpkg -i cudnn-local-repo-ubuntu2004-8.6.0.163_1.0-1_amd64.deb \
&& cp /var/cudnn-local-repo-ubuntu2004-8.6.0.163/cudnn-local-B0FE0A41-keyring.gpg /usr/share/keyrings/ \
&& apt update \
&& apt -y install libcudnn8-dev=8.6.0.163-1+cuda11.8 \
# install sample to /usr/src/cudnn_samples_v8
&& apt -y install libfreeimage-dev \
&& apt -y install libcudnn8-samples=8.6.0.163-1+cuda11.8 \
&& dpkg -i nv-tensorrt-local-repo-ubuntu2004-8.5.3-cuda-11.8_1.0-1_amd64.deb \
&& cp /var/nv-tensorrt-local-repo-ubuntu2004-8.5.3-cuda-11.8/nv-tensorrt-local-3EFA7C6A-keyring.gpg /usr/share/keyrings/ \
&& apt -y install graphsurgeon-tf libnvinfer8 libnvinfer-bin libnvinfer-dev libnvinfer-plugin8 libnvinfer-plugin-dev libnvinfer-samples libnvonnxparsers8 libnvonnxparsers-dev libnvparsers8 libnvparsers-dev onnx-graphsurgeon tensorrt tensorrt-dev tensorrt-libs uff-converter-tf \
&& apt update \
&& cd ${now} \