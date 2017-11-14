FROM ubuntu:14.04.2

ENV UPDATED_AT 2015-07-08

RUN apt-get update
RUN apt-get install -y \
    ghc \
    libghc-yaml-dev \
    libyaml-perl \
    python3 \
    python3-yaml \
    ruby \
    curl \
    bash

RUN curl -sSLf https://sh.dflemstr.io/rq | bash -s -- --yes --yes

ADD inputs /app/inputs/
ADD run.sh /app/

ADD yaml2json.hs /app/
ADD yaml2json.pl /app/
ADD yaml2json.py /app/
ADD yaml2json.rb /app/
ADD preamble.md /app/

WORKDIR /app

CMD ./run.sh
