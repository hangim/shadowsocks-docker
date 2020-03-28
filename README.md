# shadowsocks-docker

A docker image for [shadowsocks-libev](https://github.com/shadowsocks/shadowsocks-libev) server

### Download from Docker Hub 

    docker pull imhang/shadowsocks-docker

### Usage

    docker run -p 443:443 -p 443:443/udp --rm -it imhang/shadowsocks-docker


or running as a service

    docker run -d --restart=always -e "SS_PORT=443" -e "SS_PASSWORD=123456" -e "SS_METHOD=chacha20-ietf-poly1305" -e "SS_TIMEOUT=600" -p 443:443 -p 443:443/udp --name ssserver imhang/shadowsocks-docker

### Default configuration in environment variables

    SS_PORT     443
    
    SS_PASSWORD 123456
    
    SS_METHOD   chacha20-ietf-poly1305

    SS_TIMEOUT  600
