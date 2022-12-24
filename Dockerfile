FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    libncurses5-dev \
    bison \
    flex \
    libssl-dev \
    libelf-dev \
    bc \
    curl \
    git \
    crossbuild-essential-arm64 \
    wget \
    rsync \
    kmod \
    cpio 

WORKDIR /root
COPY compile.sh /root
CMD echo | bash compile.sh  