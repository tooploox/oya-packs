FROM ruby:2.5

RUN apt-get update && apt-get install -y wget curl nodejs postgresql-client
RUN wget https://github.com/mozilla/sops/releases/download/3.3.1/sops_3.3.1_amd64.deb && dpkg -i sops_3.3.1_amd64.deb
RUN curl https://oya.sh/get | bash

RUN mkdir /app
WORKDIR /app

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
COPY Oyafile ./
RUN oya run install

COPY . /app

CMD [ "oya", "run", "start" ]
