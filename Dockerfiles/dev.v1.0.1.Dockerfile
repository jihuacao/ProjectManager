# openssh-server
## 安装ssh
RUN --mount=type=bind,target=/root/DockerContext,source=DockerContext,rw \
echo 'config ssh' \
&& apt -y install openssh-server \
&& mkdir -p /var/run/sshd \
## 配置ssh
&& echo 'root:passwd'|chpasswd \
&& echo 'PermitRootLogin yes' >>/etc/ssh/sshd_config \
## ssh自启
### 构建自启脚本
&& echo '#!/bin/bash' >>~/run_sshd.sh \
&& echo 'LOGTIME=$(date "+%Y-%m-%d %H:%M:%S")' >>~/run_sshd.sh \
&& echo 'echo "[$LOGTIME] startup run..." >>~/run_sshd.log' >>~/run_sshd.sh \
&& echo 'service ssh start >>/root/run_sshd.log' >>~/run_sshd.sh \
&& chmod +x ~/run_sshd.sh \
### 在~/.bashrc中调用自启脚本
&& echo "if [ -f ~/run_sshd.sh ]; then" >> ~/.bashrc \
&& echo "    ~/run_sshd.sh" >> ~/.bashrc \
&& echo "fi" >> ~/.bashrc \
## 拷贝认证
&& mkdir -p ~/.ssh \
&& cd ${DockerContextTarget} && cp ssh/authorized_keys ~/.ssh \
&& echo "end"

RUN \
echo "install binary tools" \
&& apt -y install pandoc \
&& echo "done"

# config the vscode-server
RUN \
--mount=type=bind,target=/root/DockerContext,source=DockerContext,rw \
echo 'config vscode-server' \
&& mkdir -p ~/.vscode-server/ \
&& mkdir -p ~/.vscode-server/bin/ \
### vscode-server服务端拷贝 todo: vscode-server commit-id需要自适应
&& tar -xvf ~/DockerContext/vscode-server.tar.gz -C ~/ \
&& echo 'config vscode-server done'

RUN \
--mount=type=cache,target=/root/DockerContext,id=DockerContext \
echo "install nvidia toolset" \
&& echo "install nvtop" \
&& cd ${DockerContextTarget} \
&& echo $(ls ${DockerContextTarget}) >> a.txt \
&& echo $(ls ${DockerContextTarget}) >> a.txt \
&& apt -y install libncurses5-dev libncursesw5-dev \
&& wget -c -q https://github.com/Syllo/nvtop/archive/refs/tags/2.0.2.tar.gz -P ${DockerContextTarget} \
&& tar -xvf 2.0.2.tar.gz && cd nvtop-2.0.2 && cmake ./ && make -j 4 && make install \
&& echo "done"