ARG POSTGIS_VERSION=latest

FROM postgis/postgis:$POSTGIS_VERSION

RUN apt-get update && apt-get install -y postgis && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./scripts/init.sh /docker-entrypoint-initdb.d/init.sh
