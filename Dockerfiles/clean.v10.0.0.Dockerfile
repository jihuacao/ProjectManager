RUN \
echo "clean" \
&& rm -rf /var/lib/apt/lists/* \
&& conda clean -y --all \
&& rm -rf $(echo $(pip cache dir)"/*") \
&& echo "done"