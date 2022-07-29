# openssh-server
## 安装ssh
RUN \
--mount=type=bind,target=/root/DockerContext,source=DockerContext,rw \
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
&& cp ~/DockerContext/ssh/authorized_keys ~/.ssh \
&& echo "end"

# service mysql start >>/root/startup_run.log
# config the vscode
## config the vscode-server
# RUN \
# --mount=type=bind,target=/root/DockerContext,source=DockerContext,rw \
# echo 'config vscode-server' \
# && mkdir -p ~/.vscode-server/ \
# && mkdir -p ~/.vscode-server/bin/ \
# ### vscode-server服务端拷贝 todo: vscode-server commit-id需要自适应
# && tar -xvf ~/DockerContext/.vscode-server/x64_linux/bin.tar.gz -C ~/.vscode-server \
# ### vscode-server data拷贝
# && tar -xvf ~/DockerContext/.vscode-server/x64_linux/data.tar.gz -C ~/.vscode-server \
# ### vscode-server extensions拷贝
# && tar -xvf ~/DockerContext/.vscode-server/x64_linux/extensions.tar.gz -C ~/.vscode-server \
# && echo 'config vscode-server done'

# 安装python常用开发库
RUN \
echo "pip install" \
&& pip install matplotlib \
&& pip install ipykernel \
&& apt -y install git \
&& apt -y install zip \
&& echo "done"