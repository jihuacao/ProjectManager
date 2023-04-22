&& apt -y autoremove \
&& apt -y autoclean \
&& apt -y clean \
&& rm -rf /var/lib/apt/lists/* \