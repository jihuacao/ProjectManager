ARG MYSQL_ROOT_PASSWORD=123456
ARG MYSQL_ROOT_USER=root
ENV DEBIAN_FRONTEND noninteractive
RUN \
echo 'install MySQL' \
#&& curl -o /tmp/mysql.deb https://repo.mysql.com/get/mysql-apt-config_0.8.14-1_all.deb \
&& echo mysql-apt-config mysql-apt-config/select-server select mysql-5.7 | debconf-set-selections \
&& echo mysql-community-server mysql-community-server/root-pass $MYSQL_ROOT_PASSWORD rot | debconf-set-selections \
&& echo mysql-community-server mysql-community-server/re-root-pass $MYSQL_ROOT_PASSWORD rot | debconf-set-selections \
#&& dpkg -i /tmp/mysql.deb \
&& apt update \
&& apt clean \
&& apt purge 'mysql*' \
&& apt update \
&& apt install -f \
&& apt -y install mysql-server-5.7 mysql-server mysql-client mysql-common libmysqlclient-dev \
&& echo "[mysqld]">>/etc/mysql/my.cnf \
&& echo "collation-server=utf8_unicode_ci">>/etc/mysql/my.cnf \
&& echo "init-connect=""'""SET NAMES utf8""'">>/etc/mysql/my.cnf \
&& echo "character-set-server=utf8">>/etc/mysql/my.cnf \
&& echo "[client]">>/etc/mysql/my.cnf \
&& echo "default-character-set=utf8">>/etc/mysql/my.cnf \
&& echo "[mysql]">>/etc/mysql/my.cnf \
&& echo "default-character-set=utf8">>/etc/mysql/my.cnf \
&& echo "/etc/init.d/mysql start">>~/.bashrc \
&& echo "/etc/init.d/mysql start">>~/.bashrc \
&& echo "mysql -uroot -e \"ALTER USER""'""root""'""@""'""localhost""'"" IDENTIFIED BY ""'""123456""'"";\"">>~/.bashrc \
&& echo "mysql -uroot -p123456 -e \"create user ""'""normal""'""@""'""localhost""'"" identified by ""'""123456""'"";\"">>~/.bashrc \
&& echo "mysql -uroot -p123456 -e \"grant all on *.* to normal@""'""localhost""'"";\"">>~/.bashrc \
&& echo 'done'