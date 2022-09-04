RUN \
echo "install mmtracking deps" \
&& pip install mmdet \
&& pip install motmetrics \
&& pip install mmcls \
&& pip install lap \
&& echo "done"