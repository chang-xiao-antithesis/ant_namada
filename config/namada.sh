#!/bin/bash

echo "Checking genesis generation"
genesis_generated=0
while [ $genesis_generated -eq 0 ]
do
    echo "Checking genesis generation"
    if [ -e "/container_ready/genesis" ]; then
        echo "Validator ready to start"
        genesis_generated=1
    fi
    sleep 10
done

# Specify the directory you want to parse
directory="/genesis/genesis"

if [ -d "$directory" ]; then
    # Parse the chain id which should start with "local"
    for entry in "$directory"/local*; do
        if [ -d "$entry" ]; then
            chain_directory=$(basename "$entry")
        fi
    done
fi

if [ -z "$chain_directory" ]; then
    echo "unable to find the chain ID, cannot start the ledger node" 
    exit 1
fi

echo "The chain id is $chain_directory, starting the ledger"

/namada/target/release/namada --base-dir='/genesis/genesis' --chain-id $chain_directory ledger run