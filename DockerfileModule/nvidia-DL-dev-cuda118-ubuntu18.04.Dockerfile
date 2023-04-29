# TensorRT 8.5
# * depend
#   * cuBLAS 11
# cudnn 8.6
# 如何依赖nvidia hpc sdk安装?apt是如何扫描依赖的？可否手动添加依赖路径
&& echo "install cudnn" \
&& now=$(pwd) \
&& cd /root/DockerContext/ \
&& dpkg -i cudnn-local-repo-ubuntu1804-8.6.0.163_1.0-1_amd64.deb \
&& cp /var/cudnn-local-repo-ubuntu1804-8.6.0.163/cudnn-local-*-keyring.gpg /usr/share/keyrings/ \
&& apt update \
&& apt -y install libcudnn8=8.6.0.163-1+cuda11.8 libcudnn8-dev=8.6.0.163-1+cuda11.8 libfreeimage-dev libcudnn8-samples=8.6.0.163-1+cuda11.8 \
&& echo "install cudnn done" \
&& echo "install tensorrt" \
&& dpkg -i nv-tensorrt-local-repo-ubuntu1804-8.5.3-cuda-11.8_1.0-1_amd64.deb \
&& cp /var/nv-tensorrt-local-repo-ubuntu1804-8.5.3-cuda-11.8/nv-tensorrt-local-*-keyring.gpg /usr/share/keyrings/ \
&& apt update \
&& apt -y install graphsurgeon-tf=8.5.3-1+cuda11.8 libnvinfer8=8.5.3-1+cuda11.8 libnvinfer-bin=8.5.3-1+cuda11.8 libnvinfer-dev=8.5.3-1+cuda11.8 libnvinfer-plugin8=8.5.3-1+cuda11.8 libnvinfer-plugin-dev=8.5.3-1+cuda11.8 libnvinfer-samples=8.5.3-1+cuda11.8 libnvonnxparsers8=8.5.3-1+cuda11.8 libnvonnxparsers-dev=8.5.3-1+cuda11.8 libnvparsers8=8.5.3-1+cuda11.8 libnvparsers-dev=8.5.3-1+cuda11.8 onnx-graphsurgeon=8.5.3-1+cuda11.8 tensorrt=8.5.3.1-1+cuda11.8 tensorrt-dev=8.5.3.1-1+cuda11.8 tensorrt-libs=8.5.3.1-1+cuda11.8 uff-converter-tf=8.5.3-1+cuda11.8 \
&& dpkg -r cudnn-local-repo-ubuntu1804-8.6.0.163 && rm -r /etc/apt/sources.list.d/cudnn* \
&& dpkg -r nv-tensorrt-local-repo-ubuntu1804-8.5.3-cuda-11.8 && rm -r /etc/apt/sources.list.d/nv-tensorrt* \
&& cd ${now} \
&& echo "install tensorrt done" \