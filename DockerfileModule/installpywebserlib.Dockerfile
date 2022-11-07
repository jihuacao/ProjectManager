&& echo "install service py support" \
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
&& echo "done" \