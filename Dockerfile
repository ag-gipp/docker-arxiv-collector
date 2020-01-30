FROM adnrv/texlive:full

RUN apt-get update -qq &&\
     apt-get install -y \
            python3 \
            python3-pip \
            python3-setuptools \
     &&\
     update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1 &&\
     apt-get autoclean &&\
     apt-get autoremove &&\
     rm -rf /var/lib/apt/lists/* \
     	/tmp/* \
          /var/tmp/* 

WORKDIR /arxiv-collector

RUN pip install --upgrade pip && \
    pip install --no-cache-dir arxiv-collector

RUN arxiv-collector --get-latexmk ./latexmk && ln -sf /arxiv-collector/latexmk /usr/local/texlive/bin/x86_64-linux/latexmk

WORKDIR /data

ENTRYPOINT ["arxiv-collector"]
CMD ["--help"]
