# Shadowsocks Server Dockerfile

FROM ubuntu:16.04

RUN apt-get update && apt-get install -y python-pip python-m2crypto libsodium18
RUN pip install shadowsocks
RUN rm -rf /var/lib/apt/list/*

ENV SERVER_PORT 443
ENV PASSWORD    123456
ENV METHOD      chacha20

EXPOSE $SERVER_PORT

ENTRYPOINT /usr/local/bin/ssserver -p $SERVER_PORT -k $PASSWORD -m $METHOD
