FROM alpine:edge

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk add --update mediainfo sqlite mono
RUN mkdir /downloads \ 
    && cd /downloads \ 
    && wget http://update.sonarr.tv/v2/master/mono/NzbDrone.master.tar.gz  \
    && tar -xzvf NzbDrone.master.tar.gz \
    && mv NzbDrone /sonarr && mkdir /sonarr-data

RUN adduser -D sonarr && chown -R sonarr:sonarr /sonarr-data
WORKDIR /sonarr-data
USER sonarr

CMD mono --debug /sonarr/NzbDrone.exe /data=/sonarr-data




