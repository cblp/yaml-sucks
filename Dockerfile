FROM ubuntu:18.04

ENV UPDATED_AT 2023-07-13

RUN apt-get update
RUN apt-get install -y \
    ghc \
    libghc-yaml-dev \
    libghc-aeson-pretty-dev \
    libyaml-perl \
    libstdc++6 \
    python3 \
    python3-yaml \
    ruby \
    curl \
    bash

RUN curl -sSLf https://github.com/dflemstr/rq/releases/download/v1.0.2/rq-v1.0.2-x86_64-unknown-linux-gnu.tar.gz | tar -xz -C /usr/local/bin/ \
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
