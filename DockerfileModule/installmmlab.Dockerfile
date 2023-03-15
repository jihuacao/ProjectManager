&& echo "install mm" \
&& apt -y install ninja-build libglib2.0-0 libsm6 libxrender-dev libxext6 ffmpeg \
&& pip install mmcv-full==1.7.0 -f https://download.openmmlab.com/mmcv/dist/cu101/torch1.8.1/index.html \
&& pip install numpy==1.23.3 \
&& pip install mmdet==2.28.1 \
&& pip install mmpose==0.29.0 \
&& pip install moviepy==1.0.3 \
&& pip install ipdb==0.13.11 \
&& pip install einops==0.6.0 \
&& pip install opencv-python==4.6.0.66 \
&& apt -y install libgl1-mesa-glx \
&& apt -y install libglib2.0-0 \
&& echo "done" \