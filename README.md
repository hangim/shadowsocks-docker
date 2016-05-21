# shadowsocks-docker

A docker image for shadowsocks server

[Dockerfile](hangim/shadowsocks-docker/blob/master/Dockerfile)

[![](https://imagelayers.io/badge/imhang/shadowsocks-docker:latest.svg)](https://imagelayers.io/?images=imhang/shadowsocks-docker:latest 'Get your own badge on imagelayers.io')

### Download from Docker Hub 

> ~ $ docker pull imhang/shadowsocks-docker

### Usage

> ~ $ docker run -p 443:443 --rm -it imhang/shadowsocks-docker

or running as a service

> ~ $ docker run -d --restart=always -e "SERVER_PORT=443" -e "PASSWORD=123456" -e "METHOD=chacha20" -p 443:443 --name ssserver imhang/shadowsocks-docker

### Default configuration in environment variables

> SERVER_PORT 443

> PASSWORD    123456

> METHOD      chacha20

