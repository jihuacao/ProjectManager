&& echo "install ffmepg-python" \
#&& add-apt-repository -y ppa:mc3man/trusty-media \
&& apt update \
&& apt -y dist-upgrade \
&& apt -y install --no-install-recommends ffmpeg \
&& pip install ffmpeg-python==0.2.0 \
&& echo "done install ffmepg-python" \