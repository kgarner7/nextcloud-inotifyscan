FROM nextcloud:fpm-alpine

ENV INTERVAL=1 NEXTCLOUD_HOME=/var/www/html EXTERNAL_STORAGE=False

WORKDIR /app

COPY nextcloud-inotifyscan .

RUN apk add inotify-tools python3 && \
  chmod -R 777 /app

USER www-data
VOLUME /var/www/html

CMD ["python3", "/app/nextcloud-inotifyscan"]