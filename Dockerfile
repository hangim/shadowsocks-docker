# Shadowsocks Server Dockerfile

FROM ubuntu:16.04

RUN apt-get update && apt-get install -y python-pip python-m2crypto libsodium18
RUN pip install shadowsocks
RUN rm -rf /var/lib/apt/list/*

EXPOSE 443

CMD ["/usr/local/bin/ssserver", "-p", "443", "-k", "123456", "-m", "chacha20"]
