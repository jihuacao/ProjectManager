&& echo "install mm" \
&& pip install mmcv-full==1.5.1 -f https://download.openmmlab.com/mmcv/dist/cu102/torch1.8.0/index.html \
&& pip install mmpose \
&& pip install mmdet \
&& pip install moviepy \
&& pip install ipdb \
&& pip install einops \
&& pip install numpy==1.22.4 \
&& echo "done" \