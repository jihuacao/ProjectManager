RUN \
echo "support mmopenlab" \
&& pip install mmcv-full==1.5.1 -f https://download.openmmlab.com/mmcv/dist/cu102/torch1.8.0/index.html \
&& echo "mmopenlab done"