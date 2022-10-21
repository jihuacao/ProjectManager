# ops: config the pip
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
&& apt-get update \
&& export DEBIAN_FRONTEND=noninteractive \
&& apt -y install software-properties-common \
&& echo "end"

RUN \
--mount=type=bind,target=/root/DockerContext,source=DockerContext,rw \
echo "config c/cpp enviroment" \
&& apt -y install gcc g++ make \
&& bash /root/DockerContext/cmake-3.19.8-Linux-x86_64.sh --skip-license --prefix=/usr/local \
&& apt -y install swig \
&& apt -y install libpng-dev && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt -y install build-essential \
zlib1g-dev \
libffi-dev \
libssl-dev \
libncurses5-dev \
libreadline-dev \
libtk8.6 \
libgdm-dev \
libdb4o-cil-dev \
libpcap-dev \
&& echo "done"

RUN \
echo "install the tools" \
&& apt -y install telnet \
&& apt -y install net-tools \
&& apt -y install inetutils-ping \
&& apt -y install git \
&& apt -y install zip \
&& apt -y install wget \
&& apt -y install axel \
&& apt -y install curl \
&& apt -y install vim \
&& echo "done"

ARG MincondaPackage=Miniconda3-py39_4.12.0-Linux-x86_64.sh
ARG MincondaRoot=/root/miniconda
ARG MincondaEnvSetupBash=${MincondaRoot}/etc/profile.d/conda.sh
RUN \
--mount=type=bind,target=/root/DockerContext,source=DockerContext,rw \
echo "generate miniconda env" \
&& cd ${DockerContextTarget} \
&& wget -q -c https://repo.anaconda.com/miniconda/${MincondaPackage} \
&& chmod +x ${MincondaPackage} \
&& bash ${MincondaPackage} -b -p ${MincondaRoot} -u \
&& touch /root/.bashrc \
&& chmod +x ${MincondaEnvSetupBash} \
&& echo 'export PATH='${MincondaRoot}/bin':$PATH' >> /root/.bashrc \
&& echo 'source '${MincondaEnvSetupBash} >> /root/.bashrc \
&& echo 'conda activate base' >> /root/.bashrc \
&& source /root/.bashrc \
&& echo "done"
ENV PATH=${MincondaRoot}/bin:$PATH

RUN \
--mount=type=cache,target=/root/.cache \
mkdir -p ~/.pip \
&& echo '[global]' >> ~/.pip/pip.conf \
&& echo 'index-url=http://mirrors.aliyun.com/pypi/simple/' >> ~/.pip/pip.conf \
&& echo 'extra-index-url=http://pypi.mirrors.ustc.edu.cn/simple/' >> ~/.pip/pip.conf \
&& echo '                http://pypi.douban.com/simple/' >> ~/.pip/pip.conf \
&& echo '                https://pypi.tuna.tsinghua.edu.cn/simple/' >> ~/.pip/pip.conf \
&& echo '[install]' >> ~/.pip/pip.conf \
&& echo 'trusted-host=mirrors.aliyun.com' >> ~/.pip/pip.conf \
&& echo '             pypi.mirrors.ustc.edu.cn' >> ~/.pip/pip.conf \
&& echo '             pypi.douban.com' >> ~/.pip/pip.conf \
&& echo '             pypi.tuna.tsinghua.edu.cn' >> ~/.pip/pip.conf \
&& pip install --upgrade pip \
&& echo 'end'

SHELL ["/bin/bash", "-c"]
ARG DevCondaEnv=/root/enviroment.yaml
ARG DevEnvName=MyEnv
ARG PythonVersion=3.9.12
RUN \
echo "generate develop conda env" \
&& touch ${DevCondaEnv} \
&& echo 'name: '${DevEnvName} >> ${DevCondaEnv} \
&& echo 'channels:' >> ${DevCondaEnv} \
&& echo '  - conda-forge' >> ${DevCondaEnv} \
&& echo 'dependencies:' >> ${DevCondaEnv} \
&& echo '  - python=='${PythonVersion} >> ${DevCondaEnv} \
&& source /root/.bashrc \
&& conda env create -f ${DevCondaEnv} \
&& echo 'conda activate '${DevEnvName} >> /root/.bashrc \
&& echo "done"
SHELL ["conda", "run", "-n", "MyEnv", "/bin/bash", "-c"]

RUN \
echo "install conda cuda enviroment" \
&& echo "install cudatoolkit ops" \
&& conda install -q -y cudatoolkit=10.2 -c https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/linux-64/ \
&& echo "install cudnn ops" \
&& conda install -q -y cudnn=7.6.5 -c https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/linux-64/ \
&& echo "install nccl ops" \
&& conda install -q -y -c conda-forge nccl \
&& echo "done"
