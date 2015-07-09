FROM ubuntu:14.04.2

ENV UPDATED_AT 2015-07-08

RUN apt-get update
RUN apt-get install -y \
    ghc \
    libghc-yaml-dev \
    libyaml-perl \
    libyaml-syck-perl \
    python3 \
    python3-yaml

ADD inputs /app/inputs/
ADD run.sh /app/

ADD yaml2json.hs /app/
ADD yaml2json.pl /app/
ADD yaml-syck2json.pl /app/
ADD yaml2json.py /app/

WORKDIR /app

CMD ./run.sh
