FROM ${BaseSystem}:${BaseSystemTag}

RUN \
echo "download" \
&& wget -q https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-5.1.0-Linux-x86_64.sh \
&& echo "done"