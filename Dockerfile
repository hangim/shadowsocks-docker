# Shadowsocks Server Dockerfile

FROM alpine:3.4

RUN set -ex && \
    apk add -U --no-cache python python-dev py-pip libsodium && \
    pip install shadowsocks && \
    rm -rf /var/cache/apk/*

ENV SERVER_PORT 443
ENV PASSWORD    123456
ENV METHOD      chacha20

EXPOSE $SERVER_PORT/tcp $SERVER_PORT/udp

ENTRYPOINT /usr/bin/ssserver -p $SERVER_PORT -k $PASSWORD -m $METHOD
