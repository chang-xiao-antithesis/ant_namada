# Namada Antithesis Setup

This is mostly following the guide to setup a local network based on https://docs.namada.net/operators/networks/local-network for Antithesis testing

## How it works
In anticipation of a multi-node network setup, we created a 2-step container orchestration process:

Step 1. The `genesis` container will run the `gen_localnet.py` to create genesis related assets for starting the localnet. These assets are volume mounted to a common location for other nodes to access.

Step 2. Other nodes (e.g. validators) wait for the genesis information to be generated before starting up.

## todo

1. Add more validators/full node to the network (need guidance from Namada team)
2. Add code coverage instrumentation to the namada binary (https://antithesis.com/docs/instrumentation/rust_instrumentation.html)
3. Workload
4. (Optional) reduce the container image size. 

## Caveats/Observations/Feedbacks

1. On the documentation (https://docs.namada.net/operators/networks/local-network)
There are options for the `gen_localnet.py` `--num-nodes 2` and `--num-vals 2`. These don't appear to be valid arguments.

2. `make build-wasm-scripts` requires the installation of the `cargo install wasm-opt --locked`, it is mentioned in the make file but not clearly stated on the documentation.

3. masp parameters were extracted from a previous running container and placed into the `namada` container image so it they do not need to be downloaded at start up (Antithesis environment does not have access to the internet). However, it's unclear if those parameters are revision specific (e.g. we used v0.31.9) and the program threw a panic using https://github.com/anoma/namada-masp-params