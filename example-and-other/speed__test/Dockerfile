FROM ubuntu:18.04

MAINTAINER Nayan Biswas, https://gitlab.com/nayan32biswas

# Install C++
RUN apt-get update -y\
    && apt-get install g++ -y\
    && apt-get install build-essential -y;

# Install python3 and pip3
RUN apt-get update -y \
    && apt-get install -y python3-pip python3-dev \
    && cd /usr/local/bin \
    && ln -s /usr/bin/python3 python \
    && pip3 install --upgrade pip;



# Install nodejs and npm
RUN apt-get update \
    && apt-get -y install curl gnupg \
    && curl -sL https://deb.nodesource.com/setup_11.x  | bash - \
    && apt-get -y install nodejs \
    && npm install

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# GOLang
RUN apt-get update && \
    apt-get -y upgrade && \
    apt  install golang-go


WORKDIR /all_language
COPY . /all_language

CMD g++ --version && g++ test.cpp && ./a.out\
    && python -V && python test.py \
    && java -version && javac test.java && java Test \
    && node -v && npm -v && node test.js

# docker build -t nayan32biswas/multi_lang -f Dockerfile .
# docker run -t nayan32biswas/multi_lang
