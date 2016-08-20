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

ENV SS_PORT=443 SS_PASSWORD=123456 SS_METHOD=chacha20

EXPOSE $SERVER_PORT/tcp $SERVER_PORT/udp

ENTRYPOINT ss-server -p $SS_PORT -k $SS_PASSWORD -m $SS_METHOD -u --fast-open

