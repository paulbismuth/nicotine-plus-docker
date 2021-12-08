FROM alpine:edge

RUN addgroup -g 101 -S nicotine && \
    adduser -S -D -u 101 -h /nicotine -G nicotine -g nicotine nicotine && \
    apk update && apk upgrade && \
    apk add --virtual build-dependencies py3-pip py3-setuptools && \
    apk add bash supervisor xvfb x11vnc ttf-dejavu openbox dbus && \
    apk add novnc nicotine-plus --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && \
    pip install --upgrade setuptools && \
    pip install mutagen && \
    mkdir -p /nicotine/downloads && \
    chown -R nicotine:nicotine /nicotine && \
    sed -i "s/scale', false/scale', true/" /usr/share/novnc/vnc_lite.html && \
    ln -s /nicotine/downloads /usr/share/novnc && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/*

ADD etc /etc
ADD usr /usr

USER nicotine

ENTRYPOINT ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
