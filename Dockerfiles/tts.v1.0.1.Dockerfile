RUN \
echo "install" \
&& apt -y install libsndfile1 espeak espeak-ng libsndfile1-dev && rm -rf /var/lib/apt/lists/* \
&& echo "# core deps" > requirement.txt \
&& echo "numpy==1.21.6;python_version<\"3.10\"" >> requirement.txt \
&& echo "numpy==1.22.4;python_version==\"3.10\"" >> requirement.txt \
&& echo "cython==0.29.28" >> requirement.txt \
&& echo "scipy>=1.4.0" >> requirement.txt \
&& echo "torch>=1.7" >> requirement.txt \
&& echo "torchaudio" >> requirement.txt \
&& echo "soundfile" >> requirement.txt \
&& echo "librosa==0.8.0" >> requirement.txt \
&& echo "numba==0.55.1;python_version<\"3.10\"" >> requirement.txt \
&& echo "numba==0.55.2;python_version==\"3.10\"" >> requirement.txt \
&& echo "inflect==5.6.0" >> requirement.txt \
&& echo "tqdm" >> requirement.txt \
&& echo "anyascii" >> requirement.txt \
&& echo "pyyaml" >> requirement.txt \
&& echo "fsspec>=2021.04.0" >> requirement.txt \
&& echo "# deps for examples" >> requirement.txt \
&& echo "flask" >> requirement.txt \
&& echo "# deps for inference" >> requirement.txt \
&& echo "pysbd" >> requirement.txt \
&& echo "# deps for notebooks" >> requirement.txt \
&& echo "umap-learn==0.5.1" >> requirement.txt \
&& echo "pandas" >> requirement.txt \
&& echo "# deps for training" >> requirement.txt \
&& echo "matplotlib" >> requirement.txt \
&& echo "pyworld==0.2.10 # > 0.2.10 is not p3.10.x compatible" >> requirement.txt \
&& echo "# coqui stack" >> requirement.txt \
&& echo "trainer" >> requirement.txt \
&& echo "# config management" >> requirement.txt \
&& echo "coqpit>=0.0.16" >> requirement.txt \
&& echo "# chinese g2p deps" >> requirement.txt \
&& echo "jieba" >> requirement.txt \
&& echo "pypinyin" >> requirement.txt \
&& echo "# japanese g2p deps" >> requirement.txt \
&& echo "mecab-python3==1.0.5" >> requirement.txt \
&& echo "unidic-lite==1.0.8" >> requirement.txt \
&& echo "# gruut+supported langs" >> requirement.txt \
&& echo "gruut[cs,de,es,fr,it,nl,pt,ru,sv]==2.2.3" >> requirement.txt \
&& pip install -r requirement.txt \
&& echo "done"