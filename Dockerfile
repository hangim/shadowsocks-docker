# Shadowsocks Server Dockerfile

FROM alpine:3.3

RUN apk --no-cache add python python-dev py-pip libsodium
RUN pip install shadowsocks

ENV SERVER_PORT 443
ENV PASSWORD    123456
ENV METHOD      chacha20

EXPOSE $SERVER_PORT

ENTRYPOINT /usr/bin/ssserver -p $SERVER_PORT -k $PASSWORD -m $METHOD
