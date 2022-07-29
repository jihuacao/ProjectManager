# ops: config the pip
RUN \
--mount=type=cache,target=/root/.cache \
#--mount=type=bind,target=/root/.cache/pip,source=DockerContext/pip-cache,rw \
mkdir ~/.pip \
#&& cp /root/.cache/pip/test.md ~/ \
## 换源
&& echo '[global]' >> ~/.pip/pip.conf \
&& echo 'index-url=http://mirrors.aliyun.com/pypi/simple/' >> ~/.pip/pip.conf \
&& echo 'extra-index-url=http://pypi.mirrors.ustc.edu.cn/simple/' >> ~/.pip/pip.conf \
&& echo '                http://pypi.douban.com/simple/' >> ~/.pip/pip.conf \
&& echo '                https://pypi.tuna.tsinghua.edu.cn/simple/' >> ~/.pip/pip.conf \
## 修改缓存地址
&& echo '[install]' >> ~/.pip/pip.conf \
&& echo 'trusted-host=mirrors.aliyun.com' >> ~/.pip/pip.conf \
&& echo '             pypi.mirrors.ustc.edu.cn' >> ~/.pip/pip.conf \
&& echo '             pypi.douban.com' >> ~/.pip/pip.conf \
&& echo '             pypi.tuna.tsinghua.edu.cn' >> ~/.pip/pip.conf \
## 升级pip
&& pip install --upgrade pip \
&& echo 'end'

RUN  \
echo "pip insall" \
&& pip install web.py \
&& pip install fastapi==0.73.0 \
&& pip install opencv-python \
&& pip install uvicorn \
&& pip install scipy \
&& pip install web.py \
&& pip install fastapi==0.73.0 \
&& pip install opencv-python \
&& pip install uvicorn \
&& echo "done"

RUN \
echo "config apt" \
&& apt --help \
&& mv /etc/apt/sources.list /etc/apt/sources.list.backup \
&& echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse' >> /etc/apt/sources.list \
&& echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse' >> /etc/apt/sources.list \
&& echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse' >> /etc/apt/sources.list \
&& echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse' >> /etc/apt/sources.list \
&& echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse' >> /etc/apt/sources.list \
&& echo 'deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse' >> /etc/apt/sources.list \
&& echo 'deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse' >> /etc/apt/sources.list \
&& echo 'deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse' >> /etc/apt/sources.list \
&& echo 'deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse' >> /etc/apt/sources.list \
&& echo 'deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse' >> /etc/apt/sources.list \
&& rm /etc/apt/sources.list.d/cuda.list \
&& rm /etc/apt/sources.list.d/nvidia-ml.list \
&& apt-get update \
&& export DEBIAN_FRONTEND=noninteractive \
&& echo "end"

RUN \
echo "apt fix the opencv-python" \
&& apt -y install libgl1-mesa-glx \
&& apt -y install libglib2.0-0 \
&& echo "done"

RUN \
echo "install the extra" \
&& pip install curlify \
&& pip install Crypto \
&& pip install -U PyCryptodome \
&& pip install paramiko==2.11.0 \
&& pip install pyMySQL==1.0.2 \
&& apt -y install lsb-release \
&& apt -y install mysql-server mysql-client \
&& echo "done"

RUN \
echo "install the net tools" \
&& apt -y install telnet \
&& apt -y install net-tools \
&& apt -y install inetutils-ping \
&& echo "done"

RUN \
echo "do install" \
&& apt -y install swig \
&& pip install M2Crypto \
&& pip install openpyxl \
&& echo "done"

RUN \
echo "support mmopenlab" \
&& pip install mmcv-full==1.5.1 -f https://download.openmmlab.com/mmcv/dist/cu102/torch1.8.0/index.html \
&& echo "mmopenlab done"

RUN \
--mount=type=bind,target=/root/DockerContext,source=DockerContext,rw \
echo "install for horovod" \
&& echo "install nccl" \
&& wget -c https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-keyring_1.0-1_all.deb \
&& dpkg -i cuda-keyring_1.0-1_all.deb \
&& apt-get update \
&& apt -y --allow-change-held-packages install libnccl2=2.13.4-1+cuda10.2 libnccl-dev=2.13.4-1+cuda10.2 \
&& echo "install ompi" \
&& apt -y install openmpi-bin openmpi-doc libopenmpi-dev \
&& echo "install horovod" \
&& HOROVOD_WITH_PYTORCH=1 HOROVOD_GPU_OPERATIONS=NCCL HOROVOD_WITHOUT_GLOO=1 HOROVOD_WITH_MPI=1 pip install horovod==0.19.5 \
&& echo "done"