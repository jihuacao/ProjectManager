RUN \
echo "install shangtai" \
@import:../DockerfileModule/aptupdate.Dockerfile
@import:../DockerfileModule/installmysql.Dockerfile
&& pip install xlrd==2.0.1 \
&& pip install openpyxl==3.0.10 \
&& pip install rsa==4.9 \
@import:../DockerfileModule/aptclean.Dockerfile
@import:../DockerfileModule/pipclean.Dockerfile
&& echo "done"