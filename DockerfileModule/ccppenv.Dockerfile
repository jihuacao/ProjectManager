&& echo "config c/cpp enviroment" \
&& apt -y install gcc g++ make \
&& if [ ! -n "/root/DockerContext/cmake-3.19.8-Linux-x86_64.sh" ]; then wget -c https://cmake.org/files/v3.19/cmake-3.19.8-Linux-x86_64.sh; else echo "has"; fi \
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
&& apt -y install gdb \
&& echo "done" \