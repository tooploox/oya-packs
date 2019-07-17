FROM scottyhardy/docker-wine:latest

RUN apt-get update \
&& apt-get install -y wget curl zip osslsigncode x11-apps iputils-ping

RUN wget https://github.com/mozilla/sops/releases/download/3.3.1/sops_3.3.1_amd64.deb \
    && dpkg -i sops_3.3.1_amd64.deb \
    && curl https://oya.sh/get | bash

# RUN su - wineuser -c winecfg

COPY . /app
RUN cd /app && oya run prepare

WORKDIR /app

