RUN --mount=type=bind,target=/root/DockerContext,source=DockerContext,rw \
echo "install torch" \
&& cd ${DockerContextTarget} && wget -c -q https://download.pytorch.org/whl/cu102/torch-1.8.1%2Bcu102-cp39-cp39-linux_x86_64.whl && pip install torch-1.8.1+cu102-cp39-cp39-linux_x86_64.whl \
&& cd ${DockerContextTarget} && wget -c -q https://download.pytorch.org/whl/torchaudio-0.8.1-cp39-cp39-linux_x86_64.whl && pip install torchaudio torchaudio-0.8.1-cp39-cp39-linux_x86_64.whl \
&& cd ${DockerContextTarget} && wget -c -q https://download.pytorch.org/whl/cu102/torchvision-0.9.1%2Bcu102-cp39-cp39-linux_x86_64.whl && pip install torchvision-0.9.1+cu102-cp39-cp39-linux_x86_64.whl \
&& echo "done"