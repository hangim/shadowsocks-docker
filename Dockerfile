# Shadowsocks Server Dockerfile

FROM alpine:3.4

ENV SS_VER 2.4.8

RUN \
    apk add --no-cache --virtual .build-deps \
        curl \
        autoconf \
        build-base \
        libtool \
        linux-headers \
        openssl-dev \
        asciidoc \
        xmlto \
    && curl -fSL https://github.com/shadowsocks/shadowsocks-libev/archive/v$SS_VER.tar.gz | tar xz \
    && cd shadowsocks-libev-$SS_VER \
    && ./configure \
    && make \
    && make install \
    && cd .. \
    && rm -rf shadowsocks-libev-$SS_VER \
    && apk del .build-deps

ENV SERVER_PORT 443
ENV PASSWORD    123456
ENV METHOD      chacha20

EXPOSE $SERVER_PORT/tcp $SERVER_PORT/udp

CMD ss-server \
        -p $SERVER_PORT \
        -k $PASSWORD \
        -m $METHOD \
        -u \
        --fast-open

