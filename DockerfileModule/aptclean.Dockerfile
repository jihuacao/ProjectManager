&& apt -y autoremove \
&& apt -y autoclean \
&& apt -y clean \
&& rm -r /var/lib/apt/lists \