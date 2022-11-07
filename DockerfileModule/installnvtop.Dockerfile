&& echo "install nvtop" \
&& cd /root/DockerContext \
&& apt -y install libncurses5-dev libncursesw5-dev \
&& wget -c -q https://github.com/Syllo/nvtop/archive/refs/tags/2.0.2.tar.gz -P /root/DockerContext \
&& tar -xvf 2.0.2.tar.gz && cd nvtop-2.0.2 && cmake ./ && make -j 4 && make install \
&& echo "done" \
