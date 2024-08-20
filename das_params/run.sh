#!/bin/sh
bin/ethshadow -d data.spec spec.yaml >> spec.outlog 2>>spec.errlog
bin/ethshadow -d data.pr_6268 pr_6268.yaml >> pr_6268.outlog 2>>pr_6268.errlog
bin/ethshadow -d data.custody_08 custody_08.yaml >> custody_08.outlog 2>>custody_08.errlog
bin/ethshadow -d data.custody_16 custody_16.yaml >> custody_16.outlog 2>>custody_16.errlog
bin/ethshadow -d data.subnets_32 subnets_32.yaml >> subnets_32.outlog 2>>subnets_32.errlog
bin/ethshadow -d data.subnets_64 subnets_64.yaml >> subnets_64.outlog 2>>subnets_64.errlog
