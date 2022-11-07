&& echo "install cudatoolkit ops" \
#&& wget -c --no-check-certificate https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/linux-64/cudatoolkit-10.2.89-hfd86e86_0.conda -P /root/DockerContext \
#&& conda install -q -y --use-local /root/DockerContext/cudatoolkit-10.2.89-hfd86e86_0.conda \
&& wget --no-check-certificate -c https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/linux-64/cudatoolkit-10.1.243-h6bb024c_0.conda -P /root/DockerContext \
&& conda install -q -y --use-local /root/DockerContext/cudatoolkit-10.1.243-h6bb024c_0.conda \
#&& conda install -q -y cudatoolkit=10.2 -c https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/linux-64/ \
&& echo "install cudnn ops" \
&& wget --no-check-certificate -c https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/linux-64/cudnn-7.6.5-cuda10.1_0.conda -P /root/DockerContext \
&& conda install -q -y --use-local /root/DockerContext/cudnn-7.6.5-cuda10.1_0.conda \
#&& conda install -q -y cudnn=7.6.5 -c https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/linux-64/ \
&& echo "install nccl ops" \
&& wget --no-check-certificate -c https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/linux-64/nccl-2.8.3.1-hcaf9a05_0.conda -P /root/DockerContext \
&& conda install -q -y --use-local /root/DockerContext/nccl-2.8.3.1-hcaf9a05_0.conda \
&& echo "done" \