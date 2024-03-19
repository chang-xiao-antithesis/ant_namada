# Following the instruction from https://docs.namada.net/introduction/install/source
# This is so we can do the localnet setup
# docker build -t namada:v0.31.9 .
FROM docker.io/rust:1.76-slim-bullseye as builder

# Pinning a release tag
ARG GIT_BRANCH="v0.31.9"
ARG PROFILE="release"

# problem with libclang-12-dev, also added curl
RUN apt-get -y update
RUN apt-get install -y make git-core libssl-dev pkg-config libclang-13-dev build-essential protobuf-compiler libudev-dev curl wget

RUN git clone --depth=1 --branch="${GIT_BRANCH}" https://github.com/anoma/namada.git /namada

WORKDIR /namada

# Be aware the patch could potentially be version dependent
# getting rid of the sudo
COPY ./scripts_get_cometbft.patch .
RUN git apply scripts_get_cometbft.patch

RUN make install

# preload the MASP params (since we don't have internet)
# These params are obtained by running the ledger node first to let it download and then extracted from the running container
RUN mkdir -p /root/.masp-params
COPY ./.masp-params/* /root/.masp-params/


# not using since there's a panic with mismatch params
# It's possible that MASP params are revision specific

# RUN wget -O /root/.masp-params/masp-convert.params https://github.com/anoma/namada-masp-params/raw/master/src/masp-convert.params

# RUN wget -O /root/.masp-params/masp-output.params https://github.com/anoma/namada-masp-params/raw/master/src/masp-output.params

# RUN wget -O /root/.masp-params/masp-spend.params https://github.com/anoma/namada-masp-params/blob/master/src/masp-spend.params

# Using pre-downloaded (probably version tied) 