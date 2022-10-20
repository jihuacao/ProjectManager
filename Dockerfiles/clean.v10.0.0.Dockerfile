RUN \
echo "clean" \
&& apt -y --purge remove gcc g++ make swig axel wget vim vim-common curl \
&& apt -y autoremove \
&& rm -rf /var/lib/apt/lists/* \
&& conda clean -y --all \
&& rm -rf $(echo $(pip cache dir)"/*") \
&& rm -rf ${DockerContextTarget} \
&& echo "done"