FROM alpine:latest

MAINTAINER khiraiwa <the.world.nova@gmail.com>

RUN apk --no-cache add python2 py2-pip busybox-static && \
  pip --no-cache-dir install awscli && \
  apk --purge del py-pip && \
  rm -rf /var/cache/apk/*

COPY crontab /var/spool/cron/crontabs/root
COPY s3-sync.sh /s3-sync.sh

COPY docker-entrypoint.sh /docker-entrypoint.sh


ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD ["s3-sync"]
