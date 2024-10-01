#!/bin/sh

run() {
    bin/ethshadow -d data.$1 $1.yaml >> $1.out 2>>$1.err && \
        tar -cS -I 'zstd --long --adapt -T0' -f $1.tar.zst data.$1 $1.out $1.err && \
        rm -rf data.$1 
}

run "high_blob_current_gossipsub"
run "high_blob_full_gossipsub"
#run "high_blob_no_gossipsub"
run "low_blob_current_gossipsub"
run "low_blob_full_gossipsub"
#run "low_blob_no_gossipsub"
