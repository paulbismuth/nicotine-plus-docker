# nicotine-plus-docker

Nicotine+ v3.0 container accessible remotely via vnc.
(Heavily) inspired by https://github.com/realies/nicotine-docker

## Typical Usage

##### Using Docker CLI
```
docker run -d --name nicotine --restart=unless-stopped \
-v ./nicotine:/config/xdg/data/nicotine \
paulbismuth0/nicotine-plus
```

##### Using Docker Compose
```
docker-compose up -d
```
