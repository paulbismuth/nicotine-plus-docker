FROM alpine:edge

ARG USER=nicotine
ARG GROUP=nicotine
ARG UID=1000
ARG GID=1000

RUN addgroup -g ${GID} -S ${GROUP} && \
    adduser -S -D -u ${UID} -h /nicotine -G ${GROUP} -g nicotine ${USER} && \
    apk update && apk upgrade && \
    apk add --virtual build-dependencies py3-pip py3-setuptools && \
    apk add bash supervisor xvfb x11vnc ttf-dejavu openbox dbus && \
    apk add novnc nicotine-plus --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && \
    pip install --upgrade setuptools && \
    pip install mutagen && \
    mkdir -p /nicotine/downloads && \
    chown -R ${USER}:${GROUP} /nicotine && \
    sed -i "s/scale', false/scale', true/" /usr/share/novnc/vnc_lite.html && \
    ln -s /nicotine/downloads /usr/share/novnc && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/*

ADD etc /etc
ADD usr /usr

USER ${USER}

ENTRYPOINT ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
