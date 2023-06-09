ARG TorchVersion=1.8.1
RUN \
--mount=type=bind,target=/root/DockerContext,source=DockerContext,rw \
echo "support yolov5" \
@import:../DockerfileModule/aptupdate.Dockerfile
&& pip install "tensorboard==2.4.1" \
&& pip install "matplotlib==3.2.2" \
&& pip install "numpy==1.23.3" \
&& pip install "Pillow==9.3.0" \
&& pip install "PyYAML==5.3.1" \
&& pip install "requests==2.23.0" \
&& pip install "scipy==1.4.1" \
&& pip install "tqdm==4.64.0" \
&& pip install "protobuf==3.20.1" \
&& pip install "pandas==1.1.4" \
&& pip install "seaborn==0.11.0" \
&& pip install "ipython==8.7.0" \
&& pip install "psutil==5.9.4" \
&& pip install "thop==0.1.1.post2209072238" \
&& pip install "opencv-python==4.6.0.66" \
&& pip install -U "scikit-learn==1.2.0" \
&& pip install "shapely==2.0.0" \
&& pip install albumentations==1.0.3 \
&& apt -y install libgl1-mesa-glx \
&& apt -y install libglib2.0-0 \
@import:../DockerfileModule/aptclean.Dockerfile
@import:../DockerfileModule/pipclean.Dockerfile
&& echo "done"
