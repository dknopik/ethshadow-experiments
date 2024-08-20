#!/bin/sh
bin/ethshadow -d data.spec spec.yaml >> spec.outlog 2>>spec.errlog
bin/ethshadow -d data.custody_2 custody_2.yaml >> custody_2.outlog 2>>custody_2.errlog
bin/ethshadow -d data.custody_6 custody_6.yaml >> custody_6.outlog 2>>custody_6.errlog
bin/ethshadow -d data.sample_12 sample_12.yaml >> sample_12.outlog 2>>sample_12.errlog
bin/ethshadow -d data.sample_16 sample_16.yaml >> sample_16.outlog 2>>sample_16.errlog
bin/ethshadow -d data.subnets_032 subnets_032.yaml >> subnets_032.outlog 2>>subnets_032.errlog
bin/ethshadow -d data.subnets_064 subnets_064.yaml >> subnets_064.outlog 2>>subnets_064.errlog
