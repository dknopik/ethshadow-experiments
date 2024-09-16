#!/bin/bash
tar --use-compress-program='unzstd -T0' -xvf $1.tar.zst data.$1/node1 data.$1/node1001monitoring data.$1/jwt data.$1/metadata
