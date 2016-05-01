# shadowsocks-docker

A docker image for shadowsocks server

[Dockerfile](hangim/shadowsocks-docker/blob/master/Dockerfile)

![](https://imagelayers.io/badge/imhang/shadowsocks-docker:latest.svg)

### Download from Docker Hub 

> ~ $ docker pull imhang/shadowsocks-docker

### Usage

> ~ $ docker run -p 443:443 --rm -it imhang/shadowsocks-docker

### Default configuration in environment variables

> SERVER_PORT 443

> PASSWORD    123456

> METHOD      chacha20

