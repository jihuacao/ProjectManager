&& echo "generate miniconda env" \
&& wget -q -c https://repo.anaconda.com/miniconda/Miniconda3-py39_4.12.0-Linux-x86_64.sh -P /root/DockerContext \
&& chmod +x /root/DockerContext/Miniconda3-py39_4.12.0-Linux-x86_64.sh \
&& bash /root/DockerContext/Miniconda3-py39_4.12.0-Linux-x86_64.sh -b -p /root/miniconda -u \
&& touch /root/.bashrc \
&& chmod +x /root/miniconda/etc/profile.d/conda.sh \
&& echo 'export PATH='/root/miniconda/bin':$PATH' >> /root/.bashrc \
&& echo 'source '/root/miniconda/etc/profile.d/conda.sh >> /root/.bashrc \
&& echo 'conda activate base' >> /root/.bashrc \
&& source /root/.bashrc \
&& echo "done" \
@import:../DockerfileModule/pipconfigsource.Dockerfile