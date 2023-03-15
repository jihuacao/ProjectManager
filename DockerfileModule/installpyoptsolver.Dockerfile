&& pip install cvxpy==1.3.0 \
&& pip install cvxopt==1.3.0 \
&& apt -y install libftdi-dev default-jdk \
&& conda install -y -c conda-forge gcg==3.5.3 papilo==2.1.2 scip==8.0.3 soplex==6.0.3 zimpl==3.5.3 \
&& pip install pyscipopt==4.2.0 \
## todo: 下载SCIP wget -c https://scipopt.org/download.php?fname=scip-8.0.3.tgz -P /root/DockerContext
## 安装gmp
#apy -y install libgmp-dev
## todo: 下载papilo