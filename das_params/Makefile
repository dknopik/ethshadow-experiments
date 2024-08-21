

all: bin/lighthouse bin/lighthouse_6268 bin/lcli bin/bootnode bin/shadow bin/reth bin/ethshadow bin/blobssss bin/prometheus

bin/lighthouse: bin
	git submodule update --init lighthouse 
	cd lighthouse && RUSTFLAGS="-C target-cpu=native" cargo build --locked --bin lighthouse -F modern --profile maxperf
	rm -f bin/lighthouse
	cp lighthouse/target/maxperf/lighthouse bin

bin/lighthouse_6268: bin
	git submodule update --init lighthouse_6268 
	cd lighthouse_6268 && RUSTFLAGS="-C target-cpu=native" cargo build --locked --bin lighthouse -F modern --profile maxperf
	rm -f bin/lighthouse_6268
	mv lighthouse_6268/target/maxperf/lighthouse bin/lighthouse_6268

bin/lcli: bin
	git submodule update --init lighthouse
	cd lighthouse && RUSTFLAGS="-C target-cpu=native" cargo build --locked --bin lcli --profile release
	rm -f bin/lcli
	cp lighthouse/target/release/lcli bin

bin/bootnode: bin
	git submodule update --init go-ethereum
	cd go-ethereum && go run build/ci.go install ./cmd/bootnode
	rm -f bin/bootnode
	mv go-ethereum/build/bin/bootnode bin

bin/shadow: bin 
	git submodule update --init shadow
	cd shadow && RUSTFLAGS="-C target-cpu=native" ./setup build --clean && ./setup install
	# we are cheating - shadow is janky if we dont install it where it expects it so lets just use it in path
	# todo fix
	touch bin/shadow

bin/reth: bin
	git submodule update --init reth
	cd reth && cargo build --bin reth --profile maxperf -F reth-db/disable-lock
	rm -f bin/reth
	mv reth/target/maxperf/reth bin

bin/ethshadow: bin
	git submodule update --init ethereum-shadow
	cd ethereum-shadow && cargo build --bin ethshadow
	rm -f bin/ethshadow
	mv ethereum-shadow/target/debug/ethshadow bin

bin/blobssss: bin
	git submodule update --init blobssss
	cd blobssss && RUSTFLAGS="-C target-cpu=native" cargo build --bin blobssss --profile maxperf 
	rm -f bin/blobssss
	mv blobssss/target/maxperf/blobssss bin

bin/prometheus: bin
	git submodule update --init prometheus
	cd prometheus && go build \
	    -buildmode=pie \
	    -mod=readonly \
	    -modcacherw \
	    -ldflags "-compressdwarf=false -linkmode external -extld-flags '-Wl,-O1 -Wl,--sort-common -Wl,--as-needed -Wl,-z,relro -Wl,-z,now -Wl,-z,pack-relative-relocs'" \
	    ./cmd/prometheus
	rm -f bin/prometheus
	mv prometheus/prometheus bin


bin:
	mkdir bin

