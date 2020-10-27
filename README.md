# Docker frp
Docker image for [frp](https://github.com/fatedier/frp/), based on Alpine Linux.

Current frp version: v0.34.1

## How to use
Run frp server:
```shell
docker run -d -p 7000:7000 --name=frps --restart=always -v /path/to/config:/etc/frp acrisliu/frp
```

Run frp client:
```shell
docker run -d --name=frpc --restart=always -v /path/to/config:/etc/frp acrisliu/frp frpc -c /etc/frp/frpc.ini
```
