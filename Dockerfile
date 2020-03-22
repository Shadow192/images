# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java Open J9 (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        adoptopenjdk/openjdk11-openj9:alpine-jre

LABEL       author="Dragos Mihail" maintainer="dragos@gamster.org"

RUN apk update \
 && apk add ca-certificates openssl bash git tar sqlite fontconfig ttf-dejavu iproute2 \
 && adduser -D --home "/home/container" container
 
USER container
ENV  USER=container HOME=/home/container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
