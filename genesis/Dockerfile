# docker build -t namada-genesis:v0.31.9 .
FROM namada:v0.31.9 as builder
# https://docs.namada.net/operators/networks/local-network

ARG GIT_BRANCH="v0.31.9"

RUN apt-get update -y
RUN apt-get install python3 python3-pip wget -y
RUN pip3 install toml

RUN mkdir -p /container_ready
RUN mkdir -p /chain_data

WORKDIR /namada

RUN cargo install wasm-opt --locked

RUN make build-wasm-scripts

# RUN git clone https://github.com/anoma/namada-masp-params.git /masp-params

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]