# 安装依赖
RUN \
echo "install dep" \
&& pip install inplace_abn \
&& pip install "opencv-python>=4.1.1" \
&& apt -y install libgl1-mesa-glx \
&& apt -y install libglib2.0-0 \
&& pip install rsa==4.9 \
&& echo "done"

# todo:删除cudadev环境