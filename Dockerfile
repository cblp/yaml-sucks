FROM ubuntu:18.04

ENV UPDATED_AT 2019-02-11

RUN apt-get update
RUN apt-get install -y \
    ghc \
    libghc-yaml-dev \
    libyaml-perl \
    libstdc++6 \
    python3 \
    python3-yaml \
    ruby \
    curl \
    bash

RUN curl -sSLf https://s3-eu-west-1.amazonaws.com/record-query/record-query/x86_64-unknown-linux-gnu/rq > /usr/local/bin/rq \
    && chmod +x /usr/local/bin/rq

ADD inputs /app/inputs/
ADD run.sh /app/

ADD yaml2json.hs /app/
ADD yaml2json.pl /app/
ADD yaml2json.py /app/
ADD yaml2json.rb /app/
ADD preamble.md /app/

WORKDIR /app

CMD ./run.sh
