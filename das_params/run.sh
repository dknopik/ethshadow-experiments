#!/bin/sh

run() {
    bin/ethshadow -d data.$1 $1.yaml >> $1.out 2>>$1.err && \
        tar -cS -I 'zstd --long -T0' -f $1.tar.zst data.$1 $1.out $1.err && \
        rm -rf data.$1 
}

run "spec"
run "pr_6268"
run "custody_08"
run "custody_16"
run "subnets_32"
run "subnets_64"
run "4_of_6"
run "always_maintain"
run "supernodes_05"
run "supernodes_10"
run "supernodes_25"
run "supernodes_75"
