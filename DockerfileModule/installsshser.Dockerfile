&& echo "install ssh and config ssh" \
&& apt -y install openssh-server \
&& mkdir -p /var/run/sshd \
## 配置ssh
&& echo 'root:passwd'|chpasswd \
&& echo 'PermitRootLogin yes' >>/etc/ssh/sshd_config \
## ssh自启
### 构建自启脚本
&& echo "#!/bin/bash" >>~/run_sshd.sh \
&& echo "LOGTIME=$(date "+%Y-%m-%d %H:%M:%S")" >>~/run_sshd.sh \
&& echo "echo \"[$LOGTIME] startup run...\" >>~/run_sshd.log" >>~/run_sshd.sh \
&& echo "service ssh start >>/root/run_sshd.log" >>~/run_sshd.sh \
&& chmod +x ~/run_sshd.sh \
### 在~/.bashrc中调用自启脚本
&& echo "if [ -f ~/run_sshd.sh ]; then" >> ~/.bashrc \
&& echo "    ~/run_sshd.sh" >> ~/.bashrc \
&& echo "fi" >> ~/.bashrc \
## 拷贝认证
&& echo "拷贝个人认证" \
&& mkdir -p ~/.ssh \
&& if [ ! -n "/root/DockerContext/ssh/authorized_keys" ]; then cp /root/DockerContext/ssh/authorized_keys ~/.ssh; else echo "do not has authorized_keys"; fi \
&& echo "拷贝个人认证 done" \
&& echo "install ssh and config ssh done" \