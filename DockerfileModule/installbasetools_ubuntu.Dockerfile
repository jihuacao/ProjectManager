&& echo "install the tools" \
&& apt -y install telnet \
&& apt -y install net-tools \
&& apt -y install inetutils-ping \
&& apt -y install git \
&& apt -y install zip \
&& apt -y install wget \
&& apt -y install axel \
&& apt -y install curl \
&& apt -y install vim \
&& apt -y install tree \
&& apt -y install environment-modules \
&& ln -sf /usr/bin/tclsh8.6 /usr/bin/tclsh \
&& echo "source /usr/share/modules/init/bash" >> ~/.bashrc \
&& echo "done" \
