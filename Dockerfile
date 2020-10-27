FROM alpine

LABEL maintainer="ryanaltair <al_tair@live.com>"

ENV FRP_VERSION 0.34.1
ENV PLATFROM linux_amd64

RUN set -ex \
    && apk add --no-cache --virtual .build-deps openssl \
    && cd /tmp \
    && wget https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_${PLATFROM}.tar.gz \
    && tar zxvf frp_${FRP_VERSION}_${PLATFROM}.tar.gz \
    && rm frp_${FRP_VERSION}_${PLATFROM}.tar.gz \
    && cd frp_${FRP_VERSION}_${PLATFROM} \
    && cp frps /usr/local/bin \
    && cp frpc /usr/local/bin \
    && mkdir /etc/frp \
    && cp frps.ini /etc/frp \
    && cp frpc.ini /etc/frp \
    && cd .. \
    && rm -rf frp_${FRP_VERSION}_${PLATFROM} \
    && apk update \
    && apk add openssh-client \
    && apk del .build-deps

VOLUME /etc/frp

CMD ["frps", "-c", "/etc/frp/frps.ini"]
