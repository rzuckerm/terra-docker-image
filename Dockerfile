FROM ubuntu:22.04

COPY TERRA_* /tmp/
RUN apt-get update && \
    apt-get install -y wget xz-utils gcc && \
    cd /usr/local && \
    wget https://github.com/terralang/terra/releases/download/release-$(cat /tmp/TERRA_VERSION)/terra-Linux-x86_64-$(cat /tmp/TERRA_COMMIT_HASH).tar.xz \
        -O /tmp/terra.tar.xz && \
    tar xJf /tmp/terra.tar.xz --strip-components=1 && \
    rm -f /tmp/terra.tar.xz && \
    apt-get remove -y wget xz-utils && \
    apt-get autoremove -y
