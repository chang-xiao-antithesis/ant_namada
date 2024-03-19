#!/bin/bash

set -e

echo "Generating genesis for localnet"

python3 /namada/scripts/gen_localnet.py \
--localnet-dir /namada/genesis/localnet \
--mode release \
--base-dir /root/genesis

echo "Genesis information ready"

cp -r /root/genesis /chain_data

touch /container_ready/genesis

sleep infinity