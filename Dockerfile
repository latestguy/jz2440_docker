FROM ubuntu:16.04

RUN sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
#RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

# locale set

RUN apt-get update && apt-get install -y \
    vim \
    build-essential \
    make \
    cmake \
    git \
    zlib1g-dev \
    bc \
    libncurses5-dev \
    bear \
    curl \
    wget \
    locales \
    realpath \
    lsb-core

RUN apt-get install -f -y \
    && dpkg --add-architecture i386 \
    && apt update \
    && apt install libc6:i386 -y


ENV LANG zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8
RUN locale-gen zh_CN.UTF-8

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

RUN adduser public && chmod a+r /etc/bash.bashrc

USER public

RUN chmod a+r /home/public/.bashrc

WORKDIR /home/public/work/arm/jz2440
