RUN \
echo "install service base lib support" \
#&& apt -y install lsb-release \
#&& apt -y install mysql-server mysql-client \
&& echo "done"

RUN  \
echo "install service py support" \
&& pip install web.py \
&& pip install fastapi==0.73.0 \
&& pip install uvicorn \
&& pip install curlify \
&& pip install Crypto \
&& pip install -U PyCryptodome \
&& pip install paramiko==2.11.0 \
&& pip install pyMySQL==1.0.2 \
&& pip install M2Crypto \
&& pip install openpyxl \
&& echo "done"

RUN \
echo "install data science library" \
&& apt -y install gfortran libopenblas-dev liblapack-dev && pip install numpy==1.18.5 \
&& pip install pandas==1.3.5 \
&& pip install seaborn==0.11.0 \
&& MPLLOCALFREETYPE=1 pip install matplotlib==3.2.2 \
&& pip install scipy==1.4.1 \
&& pip install pandas==1.1.4 \
&& pip install ipykernel \
&& pip install ptvsd==4.3.2 \
&& pip install colorama==0.4.5 \
&& pip install loguru==0.6.0 \
&& echo "done"

RUN \
echo "support torch GCN" \
&& pip install "networkx==2.8.5" \
&& echo "done"