&& echo "fix chinese" \
&& apt -y install language-pack-zh-hans \
&& echo "LANG=\"zh_CN.UTF-8\"" >> /etc/environment \
&& echo "LANGUAGE=\"zh_CN:zh:en_US:en\"" >> /etc/environment \
&& echo "en_US.UTF-8 UTF-8" >> /var/lib/locales/supported.d/local \
&& echo "zh_CN.UTF-8 UTF-8" >> /var/lib/locales/supported.d/local \
&& echo "zh_CN.GBK GBK" >> /var/lib/locales/supported.d/local \
&& echo "zh_CN GB2312" >> /var/lib/locales/supported.d/local \
&& locale-gen \
&& apt -y install fonts-droid-fallback ttf-wqy-zenhei ttf-wqy-microhei fonts-arphic-ukai fonts-arphic-uming \
&& echo "fix chinese done" \