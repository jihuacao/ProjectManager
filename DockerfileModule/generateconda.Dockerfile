&& echo "generate miniconda env" \
&& wget -q -c https://repo.anaconda.com/miniconda/Miniconda3-py39_4.12.0-Linux-x86_64.sh -P /root/DockerContext \
&& chmod +x /root/DockerContext/Miniconda3-py39_4.12.0-Linux-x86_64.sh \
&& bash /root/DockerContext/Miniconda3-py39_4.12.0-Linux-x86_64.sh -b -p ${CondaRoot}/miniconda -u \
&& touch /root/.bashrc \
&& chmod +x ${CondaRoot}/miniconda/etc/profile.d/conda.sh \
&& echo 'export PATH='${CondaRoot}/miniconda/bin':$PATH' >> /root/.bashrc \
&& echo 'source '${CondaRoot}/miniconda/etc/profile.d/conda.sh >> /root/.bashrc \
&& echo 'conda activate base' >> /root/.bashrc \
&& source /root/.bashrc \
&& echo "done" \
@import:../DockerfileModule/pipconfigsource.Dockerfile