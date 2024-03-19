# docker build -t namada-config:latest .
FROM scratch

COPY ./docker-compose.yml /docker-compose.yml
COPY ./container_ready/* /container_ready/
COPY ./genesis/* /genesis/
COPY ./namada.sh /namada.sh