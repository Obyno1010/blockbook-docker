#!/bin/bash

RPC_USER="${RPC_USER:-user}"
RPC_PASS="${RPC_PASS:-pass}"
RPC_PORT="${RPC_PORT:-9130}"
RPC_HOST="${RPC_HOST:-localhost}"


CFG_FILE=$HOME/blockchain_cfg.json

sed -i 's/@RPC_USER@/'"$RPC_USER"'/' $CFG_FILE 
sed -i 's/@RPC_PASS@/'"$RPC_PASS"'/' $CFG_FILE 
sed -i 's/@RPC_HOST@/'"$RPC_HOST"'/g' $CFG_FILE 
sed -i 's/@RPC_PORT@/'"$RPC_PORT"'/' $CFG_FILE 


cd $GOPATH/src/blockbook && exec ./blockbook -sync -blockchaincfg=$HOME/blockchain_cfg.json -internal=:9030 -public=:9130 -certfile=server/testcert -logtostderr
