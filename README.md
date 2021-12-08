# nicotine-plus-docker

Nicotine+ v3.0 container accessible remotely via vnc.
(Heavily) inspired by https://github.com/realies/nicotine-docker

## Typical Usage

##### Using Docker CLI
```
docker run -d --name nicotine --restart=always \
-v /var/nicotine-plus-docker/nicotine:/nicotine/.nicotine \
-v /var/nicotine-plus-docker/downloads:/nicotine/downloads \
-p 6080:6080 \
paulbismuth0/nicotine-plus
```

##### Using Docker Compose
```
docker-compose up -d
```
