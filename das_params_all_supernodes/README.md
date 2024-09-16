# Experiment: PeerDAS Metrics with Supernodes

## Intoduction

This was the first experiment set I've performed, and it was with the intention to use no supernodes - but due to a configuration mistake ALL nodes are supernodes. 

## Configuration

There are 6 experiments in this series. They are based on config values as found [here](https://github.com/ethereum/consensus-specs/blob/13ac373a2c284dc66b48ddd2ef0a10537e4e0de6/specs/_features/eip7594/das-core.md#configuration), with the following exceptions:

| Experiment | Info |
| ---------- | ---- |
| custody_08 | Set CUSTODY_REQUIREMENT to 8 |
| custody_16 | Set CUSTODY_REQUIREMENT to 16 |
| pr_6268    | Use a different build of Lighthouse (see below) |
| spec       | No changes |
| subnets_32 | Set DATA_COLUMN_SIDECAR_SUBNET_COUNT to 32 and CUSTODY_REQUIREMENTS to 1 |
| subnets_64 | Set DATA_COLUMN_SIDECAR_SUBNET_COUNT to 64 and CUSTODY_REQUIREMENTS to 2 |

Note that pr_6268 is almost equivalent to spec, as the used build of Reth was not compatible.

## Versions

| Component | Commit | Based on upstream commit |
| --------- | ------ | ------------------------ |
| blobssss | 86739a377049a343bed6718ba641439cba0c5e52 | N/A |
| ethereum-shadow | ff3045f9503aec6229099e86bfdc2aa1f8d9d7ef | N/A |
| go-ethereum | 87377c58bc7acd437b6495706e0dcfece6aa1d21 | N/A (commit is upstream) |
| lighthouse | 5249549e7fa0fa5bebcc8b8ae9fcbb030f68b902 | f39f97c3ab966fcfab2a744360d9e847e91c8a08 |
| lighthouse (for pr_6268) | 7221a4ce4fc1aca220236e346208e1ef97f0d927 | bd24cdd93427f9acf03c73196d16f0c246c37711 |
| prometheus | 6e971a7dc905696d4bc4ffa150bf282fcfac5fa9 | N/A (commit is upstream) |
| reth | 29ea703a2fc9e5638623afb8b9010f8475b9e3c3 | 9bed8cf46661b9db2d4687d5fe4a72d37f398080 |
| shadow | 2c442c7d7e7e3930a6270b8ac822ba5b2c2782c3 | daa5b470969226322a50e110f3f02b6e9e7d1517 |

## Results

The result data is available as archives and contain all node data as well as captured prometheus metrics. It is recommended to extract selectively.

| Experiment | Link |
| ---------- | ---- |
| custody_08 | https://files.dknopik.de/das_params_supernodes/custody_08.tar.zst |
| custody_16 | https://files.dknopik.de/das_params_supernodes/custody_16.tar.zst |
| pr_6268    | https://files.dknopik.de/das_params_supernodes/pr_6268.tar.zst |
| spec       | https://files.dknopik.de/das_params_supernodes/spec.tar.zst |
| subnets_32 | https://files.dknopik.de/das_params_supernodes/subnets_32.tar.zst |
| subnets_64 | https://files.dknopik.de/das_params_supernodes/subnets_64.tar.zst |



