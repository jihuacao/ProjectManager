&& mkdir -p ~/.pip \
&& rm ~/.pip/pip.conf \
&& echo '[global]' >> ~/.pip/pip.conf \
&& echo 'index-url=http://mirrors.aliyun.com/pypi/simple/' >> ~/.pip/pip.conf \
&& echo 'extra-index-url=http://pypi.mirrors.ustc.edu.cn/simple/' >> ~/.pip/pip.conf \
&& echo '                http://pypi.douban.com/simple/' >> ~/.pip/pip.conf \
&& echo '                https://pypi.tuna.tsinghua.edu.cn/simple/' >> ~/.pip/pip.conf \
&& echo '                http://pypi.hustunique.com/' >> ~/.pip/pip.conf \
&& echo '                http://pypi.sdutlinux.org/' >> ~/.pip/pip.conf \
&& echo '[install]' >> ~/.pip/pip.conf \
&& echo 'trusted-host=mirrors.aliyun.com' >> ~/.pip/pip.conf \
&& echo '             pypi.mirrors.ustc.edu.cn' >> ~/.pip/pip.conf \
&& echo '             pypi.douban.com' >> ~/.pip/pip.conf \
&& echo '             pypi.tuna.tsinghua.edu.cn' >> ~/.pip/pip.conf \
&& echo '             pypi.hustunique.com' >> ~/.pip/pip.conf \
&& echo '             pypi.sdutlinux.org' >> ~/.pip/pip.conf \
&& echo 'end' \