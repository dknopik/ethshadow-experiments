#!/bin/sh
bin/ethshadow -d data.spec spec.yaml >> spec.out 2>>spec.err
bin/ethshadow -d data.pr_6268 pr_6268.yaml >> pr_6268.out 2>>pr_6268.err
bin/ethshadow -d data.custody_08 custody_08.yaml >> custody_08.out 2>>custody_08.err
bin/ethshadow -d data.custody_16 custody_16.yaml >> custody_16.out 2>>custody_16.err
bin/ethshadow -d data.subnets_32 subnets_32.yaml >> subnets_32.out 2>>subnets_32.err
bin/ethshadow -d data.subnets_64 subnets_64.yaml >> subnets_64.out 2>>subnets_64.err
