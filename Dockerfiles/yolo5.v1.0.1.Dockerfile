ARG TorchVersion=1.8.1
RUN \
--mount=type=bind,target=/root/DockerContext,source=DockerContext,rw \
echo "support yolov5" \
&& cd /root/DockerContext && wget -c -q https://download.pytorch.org/whl/cu102/torch-1.8.1%2Bcu102-cp39-cp39-linux_x86_64.whl && pip install --force-reinstall torch-1.8.1+cu102-cp39-cp39-linux_x86_64.whl \
&& cd /root/DockerContext && wget -c -q https://download.pytorch.org/whl/torchaudio-0.8.1-cp39-cp39-linux_x86_64.whl && pip install --force-reinstall torchaudio torchaudio-0.8.1-cp39-cp39-linux_x86_64.whl \
&& cd /root/DockerContext && wget -c -q https://download.pytorch.org/whl/cu102/torchvision-0.9.1%2Bcu102-cp39-cp39-linux_x86_64.whl && pip install --force-reinstall torchvision-0.9.1+cu102-cp39-cp39-linux_x86_64.whl \
&& pip install "tensorboard>=2.4.1" \
&& pip install "matplotlib>=3.2.2" \
&& pip install "numpy>=1.18.5" \
&& pip install "Pillow>=7.1.2" \
&& pip install "PyYAML>=5.3.1" \
&& pip install "requests>=2.23.0" \
&& pip install "scipy>=1.4.1" \
&& pip install "tqdm>=4.64.0" \
&& pip install "protobuf<=3.20.1" \
&& pip install "pandas>=1.1.4" \
&& pip install "seaborn>=0.11.0" \
&& pip install "ipython" \
&& pip install "psutil" \
&& pip install "thop>=0.1.1" \
&& pip install "opencv-python>=4.1.1" \
&& apt -y install libgl1-mesa-glx \
&& apt -y install libglib2.0-0 \
&& echo "done"
