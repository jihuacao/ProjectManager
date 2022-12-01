# https://shuwoom.com/?p=4289
# https://www.yisu.com/zixun/696299.html
# https://cloud.tencent.com/developer/article/1043931
# https://groups.google.com/g/OpenResty/c/J1tssHdwYqw/m/vzK1AA1wfJsJ?pli=1
&& echo "install nginx with lua" \
&& apt -y install nginx-full \
&& apt -y install lua5.2 lua5.2-doc liblua5.2-dev \
&& apt -y install luajit luarocks \
&& apt -y install libnginx-mod-http-lua \
&& apt -y install lua-cjson \
&& luarocks install lyaml \
&& luarocks install luadbi-mysql MYSQL_INCDIR=/usr/include/mysql \
@import:../DockerfileModule/luaclean.Dockerfile
&& echo "done" \