&& echo "install torch" \
&& cd /root/DockerContext && wget -c -q https://download.pytorch.org/whl/cu102/torch-1.8.1%2Bcu102-cp39-cp39-linux_x86_64.whl && pip install torch-1.8.1+cu102-cp39-cp39-linux_x86_64.whl \
&& cd /root/DockerContext && wget -c -q https://download.pytorch.org/whl/torchaudio-0.8.1-cp39-cp39-linux_x86_64.whl && pip install torchaudio-0.8.1-cp39-cp39-linux_x86_64.whl \
&& cd /root/DockerContext && wget -c -q https://download.pytorch.org/whl/cu102/torchvision-0.9.1%2Bcu102-cp39-cp39-linux_x86_64.whl && pip install torchvision-0.9.1+cu102-cp39-cp39-linux_x86_64.whl \
&& echo "done" \