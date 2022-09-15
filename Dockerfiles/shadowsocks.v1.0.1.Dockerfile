# important: 目前在tts进行测试
RUN \
echo "git clone" \
git clone https://github.com/jihuacao/CommonConfig.git \
# todo: 两个config需要修改，修改为输出bash文件，避免在container中使用systemctl
python CommonConfig/linux/kcptun/config.py --config_client --client_executable_dir=/root/kcptun --client_config_path=/root/kcptun --client_service_dir=/root/kcptun --client_remote_port 18887 18889 18891 18893 18895 18897 --client_local_port 18887 18889 18891 18893 18895 18897 --client_remote_ip=182.0.0.1 \
python CommonConfig/linux/shadowsocks/config.py --config_client --kcptun_client --client_config_path=/root/shadowsocks --client_service_dir=/root/shadowsocks --client_local_port 18888 18890 18892 18894 18896 18898 --client_kcptun_local_port 18887 18889 18891 18893 18895 18897 \
pip install shadowsocks==2.8.2 \
# todo: openssl需要修改