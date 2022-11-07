&& echo "install data science library" \
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
&& pip install "networkx==2.8.5" \
&& echo "done" \