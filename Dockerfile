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

WORKDIR /data

RUN pip install --upgrade pip && \
    pip install --no-cache-dir arxiv-collector
