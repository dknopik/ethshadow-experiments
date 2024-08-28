#!/bin/sh

run() {
    bin/ethshadow -d data.$1 $1.yaml >> $1.out 2>>$1.err && \
        tar -cS -I 'zstd --long -T0' -f $1.tar.xst data.$1 $1.out $1.err && \
        rm -rf data.$1 
}

run "spec"
run "pr_6268"
run "custody_08"
run "custody_16"
run "subnets_32"
run "subnets_64"

