&& echo "generate develop conda env" \
&& touch /root/enviroment.yaml \
&& rm /root/enviroment.yaml \
&& echo 'name: 'MyEnv >> /root/enviroment.yaml \
&& echo 'channels:' >> /root/enviroment.yaml \
&& echo '  - conda-forge' >> /root/enviroment.yaml \
&& echo 'dependencies:' >> /root/enviroment.yaml \
&& echo '  - python=='${PythonVersion} >> /root/enviroment.yaml \
&& source /root/.bashrc \
&& conda env create -f /root/enviroment.yaml \
&& echo 'conda activate 'MyEnv >> /root/.bashrc \
&& ln -sf ${CondaRoot}/miniconda/envs/MyEnv/bin/python ${PythonLink} \
&& ln -sf ${CondaRoot}/miniconda /root/miniconda \
&& echo "done" \