# Shadowsocks Server Dockerfile

FROM alpine:3.5

ARG SS_VER=3.0.0

RUN \
    set -ex \
    && apk add --no-cache --virtual .build-deps \
        curl \
        autoconf \
        build-base \
        libtool \
        linux-headers \
        libressl-dev \
        zlib-dev \
        asciidoc \
        xmlto \
        pcre-dev \
        automake \
        mbedtls-dev \
        libsodium-dev \
        udns-dev \
        libev-dev \
    && apk add --no-cache --virtual .run-deps \
        pcre \
        libev \
        udns \
        libsodium \
        mbedtls \
    && curl -fsSL https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$SS_VER/shadowsocks-libev-$SS_VER.tar.gz | tar xz \
    && cd shadowsocks-libev-$SS_VER \
    && ./configure \
    && make \
    && make install \
    && cd .. \
    && rm -rf shadowsocks-libev-$SS_VER \
    && apk del .build-deps

ENV SS_PORT=443 SS_PASSWORD=123456 SS_METHOD=chacha20 SS_TIMEOUT=600

EXPOSE $SS_PORT/tcp $SS_PORT/udp

ENTRYPOINT ss-server -p $SS_PORT -k $SS_PASSWORD -m $SS_METHOD -t $SS_TIMEOUT -d 8.8.8.8 -d 208.67.222.222 -u --fast-open

