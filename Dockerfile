FROM jlesage/baseimage-gui:debian-11

RUN apt-get update && \
    apt install software-properties-common gpg -y && \
    add-apt-repository ppa:nicotine-team/stable && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6CEB6050A30E5769 && \
    apt update && \
    apt install nicotine -y && \
    mkdir -p /config/nicotine/downloads && \

COPY startapp.sh /startapp.sh

ENV APP_NAME="Nicotine+"
