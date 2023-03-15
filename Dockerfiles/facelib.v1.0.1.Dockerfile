# 安装依赖
RUN \
echo "install facelib dep" \
@import:../DockerfileModule/aptupdate.Dockerfile
&& pip install inplace_abn \
&& pip install "opencv-python>=4.1.1" \
&& apt -y install libgl1-mesa-glx \
&& apt -y install libglib2.0-0 \
&& pip install rsa==4.9 \
@import:../DockerfileModule/aptclean.Dockerfile
@import:../DockerfileModule/pipclean.Dockerfile
&& echo "done"