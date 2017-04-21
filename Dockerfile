FROM ubuntu:16.04

RUN apt-get update && apt-get install -y --no-install-recommends \
        python-dev \
        libmysqlclient-dev \
        openjdk-9-jdk-headless \
        python-pip \
        python3 \
        python3-pip \
        python3-dev \
        sudo \
        curl \
        git \
        ruby ruby-dev rubygems build-essential && \
    rm -rf /var/cache/apt/archives

ADD pants.ini pants /src/
WORKDIR /src

# Bootstrap
RUN ./pants goals

ADD . /src/

