RUN \
echo "install MySQL" \
&& apt -y install mysql-server \
&& /etc/init.d/mysql start \
&& echo "/etc/init.d/mysql start" >> ~/.bashrc \
# 新建用户normal
&& mysql -uroot -p123456 -e "create user 'normal'@'localhost' identified by '123456'" \
# 设置用户权限，支持最高权限
&& mysql -uroot -p123456 -e "grant all on *.* to normal@'localhost'" \
&& echo "done"