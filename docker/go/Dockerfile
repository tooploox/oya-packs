FROM golang

RUN apt-get update && apt-get install -y wget curl
RUN wget https://github.com/mozilla/sops/releases/download/3.3.1/sops_3.3.1_amd64.deb && dpkg -i sops_3.3.1_amd64.deb
RUN curl https://oya.sh/get | bash

COPY . /go/src/app
WORKDIR /go/src/app

RUN oya run install
RUN oya run build

CMD [ "oya", "run", "start" ]
