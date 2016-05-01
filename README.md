# shadowsocks-docker

shadowsocks-docker

# Download and Build

> ~ $ git clone https://github.com/hangim/shadowsocks-docker.git

> ~ $ cd shadowsocks-docker/

> ~/shadowsocks-docker $ docker build -t ssserver .

# Usage

> ~/shadowsocks-docker $ docker run -p 443:443 --rm -it ssserver /usr/local/bin/ssserver -p 443 -k 123456 -m chacha20

