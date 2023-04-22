FROM nvidia/cuda:10.1-runtime-ubuntu18.04

RUN
--mount=type=cache,target=/root/DockerContext,id=DockerContext \
echo "install pyenv" \
@import:../DockerfileModule/aptupdatesource.Dockerfile
@import:../DockerfileModule/aptupdate.Dockerfile
&& apt -y install python3.7 \
&& apt -y install python3-pip \
&& apt-get install -y --no-install-recommends \
    libsm6 \
    libxext6 \
    libxrender1 \
    libglib2.0-bin \
    libgomp1 \
    libgl1-mesa-glx \
    vim \
    curl \
@import:../DockerfileModule/pipconfigsource.Dockerfile \
&& python3.7 -m pip install --upgrade pip \
&& python3.7 -m pip install jupyterlab -i https://pypi.douban.com/simple \
&& python3.7 -m pip install absl-py==1.4.0 \
&& python3.7 -m pip install Bottleneck \
&& python3.7 -m pip install cachetools \
&& python3.7 -m pip install certifi \
&& python3.7 -m pip install cffi \
&& python3.7 -m pip install charset-normalizer \
&& python3.7 -m pip install filelock==3.10.7 \
&& python3.7 -m pip install flit_core \
&& python3.7 -m pip install future \
&& python3.7 -m pip install google-auth==2.17.1 \
&& python3.7 -m pip install google-auth-oauthlib==0.4.6 \
&& python3.7 -m pip install grpcio==1.53.0 \
&& python3.7 -m pip install huggingface-hub==0.13.3 \
&& python3.7 -m pip install idna==3.4 \
&& python3.7 -m pip install importlib-metadata==6.1.0 \
&& python3.7 -m pip install jieba==0.42.1 \
&& python3.7 -m pip install joblib==1.2.0 \
&& python3.7 -m pip install Markdown==3.4.3 \
&& python3.7 -m pip install MarkupSafe==2.1.2 \
&& python3.7 -m pip install mkl-fft==1.3.1 \
&& python3.7 -m pip install mkl-random \
&& python3.7 -m pip install mkl-service==2.4.0 \
&& python3.7 -m pip install numexpr \
&& python3.7 -m pip install numpy \
&& python3.7 -m pip install oauthlib==3.2.2 \
&& python3.7 -m pip install packaging \
&& python3.7 -m pip install pandas==1.3.5 \
&& python3.7 -m pip install protobuf==3.20.3 \
&& python3.7 -m pip install pyasn1==0.4.8 \
&& python3.7 -m pip install pyasn1-modules==0.2.8 \
&& python3.7 -m pip install pycparser \
&& python3.7 -m pip install python-dateutil \
&& python3.7 -m pip install pytz \
&& python3.7 -m pip install PyYAML \
&& python3.7 -m pip install regex==2022.10.31 \
&& python3.7 -m pip install requests==2.28.2 \
&& python3.7 -m pip install requests-oauthlib==1.3.1 \
&& python3.7 -m pip install rsa==4.9 \
&& python3.7 -m pip install scikit-learn==1.0.2 \
&& python3.7 -m pip install scipy==1.7.3 \
&& python3.7 -m pip install six \
&& python3.7 -m pip install tensorboard==2.11.2 \
&& python3.7 -m pip install tensorboard-data-server==0.6.1 \
&& python3.7 -m pip install tensorboard-plugin-wit==1.8.1 \
&& python3.7 -m pip install threadpoolctl==3.1.0 \
&& python3.7 -m pip install tokenizers==0.13.2 \
&& python3.7 -m pip install torch==1.12.1+cu101 \
&& python3.7 -m pip install tqdm==4.65.0 \
&& python3.7 -m pip install transformers==4.27.4 \
&& python3.7 -m pip install typing_extensions \
&& python3.7 -m pip install urllib3==1.26.15 \
&& python3.7 -m pip install Werkzeug==2.2.3 \
&& python3.7 -m pip install zipp==3.15.0 \
@import:../DockerfileModule/pipclean.Dockerfile \
@import:../DockerfileModule/aptclean.Dockerfile \
&& echo "done"

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

RUN jupyter notebook --generate-config
RUN sed -i "s@#c.NotebookApp.token = '<generated>'@c.NotebookApp.token = ''@g" /root/.jupyter/jupyter_notebook_config.py
RUN sed -i "s@# c.NotebookApp.token = '<generated>'@c.NotebookApp.token = ''@g" /root/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.tornado_settings = { 'headers': { 'Content-Security-Policy': \"frame-ancestors 'self' *\" } }">>/root/.jupyter/jupyter_notebook_config.py
RUN echo "alias ll='ls $LS_OPTIONS -l'">>~/.bashrc
COPY ./.vimrc /root/
ENV SHELL=/bin/bash
CMD ["/bin/bash", "-c", "source ~/.bashrc && jupyter lab --ServerApp.disable_check_xsrf=True --notebook-dir=/project --ip 0.0.0.0 --no-browser --allow-root"]