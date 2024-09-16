#!/bin/bash

dir=$(mktemp -d)

lighthouse --testnet-dir data.$1/metadata beacon_node --datadir data.$1/node1/lighthouse --http --http-port 31001 --disable-quic --disable-upnp --disable-packet-filter --metrics-address 0.0.0.0 --metrics-port 32001 --metrics --execution-endpoint http://localhost:21001 --execution-jwt data.$1/jwt/jwtsecret &>/dev/null &
lh=$!
echo Lighthouse: ${lh}
  
reth node --chain data.$1/metadata/genesis.json --datadir data.$1/node1/reth --authrpc.port 21001 --authrpc.jwtsecret data.$1/jwt/jwtsecret --http --http.addr 0.0.0.0 --http.port 22001 --http.api eth,rpc,web3 --port 21000 --nat extip:81.168.199.180 --ipcdisable --log.file.directory data.$1/node1/reth &>/dev/null &
reth=$!
echo Reth: ${reth} 

echo "
chain:
  genesisTimestamp: 946685100
  configPath: $(realpath data.$1/metadata)
  displayName: $1
beaconapi:
  endpoint: http://127.0.0.1:31001
database:
  engine: sqlite
  sqlite:
    file: $dir/dora.sqlite
server:
  host: localhost
  port: 8080
frontend:
  enabled: true
" > $dir/dora.yaml
dora-explorer -config=$dir/dora.yaml &>/dev/null &
dora=$!
echo Dora: ${dora}

prometheus --storage.tsdb.path=./data.$1/node1001monitoring/prometheus --storage.tsdb.retention.time=25y --config.file=/dev/null &>/dev/null &
prom=$!
echo Prometheus: ${prom}

echo Ctrl-C to stop.
trap "echo Stopping...; kill -15 ${lh} ${reth} ${prom} ${dora}" INT
wait
rm -rf $dir

