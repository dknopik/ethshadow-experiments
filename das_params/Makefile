

all: bin/lighthouse bin/lighthouse_6268 bin/lcli bin/bootnode bin/shadow bin/reth bin/ethshadow bin/blobssss bin/prometheus

bin/lighthouse: bin
	cd lighthouse && RUSTFLAGS="-C target-cpu=native" cargo build --locked --bin lighthouse -F modern --profile maxperf
	rm -f bin/lighthouse
	cp lighthouse/target/maxperf/lighthouse bin

bin/lighthouse_6268: bin
	cd lighthouse_6268 && RUSTFLAGS="-C target-cpu=native" cargo build --locked --bin lighthouse -F modern --profile maxperf
	rm -f bin/lighthouse_6268
	cp lighthouse_6268/target/maxperf/lighthouse bin/lighthouse_6268

bin/lcli: bin
	cd lighthouse && RUSTFLAGS="-C target-cpu=native" cargo build --locked --bin lcli --profile release
	rm -f bin/lcli
	cp lighthouse/target/release/lcli bin

bin/bootnode: bin
	cd go-ethereum && go run build/ci.go install ./cmd/bootnode
	rm -f bin/bootnode
	cp go-ethereum/build/bin/bootnode bin

bin/shadow: bin 
	cd shadow && RUSTFLAGS="-C target-cpu=native" ./setup build --clean && ./setup install
	# we are cheating - shadow is janky if we dont install it where it expects it so lets just use it in path
	# todo fix
	touch bin/shadow

bin/reth: bin
	cd reth && cargo build --bin reth --profile maxperf -F reth-db/disable-lock
	rm -f bin/reth
	cp reth/target/maxperf/reth bin

bin/ethshadow: bin
	cd ethereum-shadow && cargo build --bin ethshadow
	rm -f bin/ethshadow
	cp ethereum-shadow/target/debug/ethshadow bin

bin/blobssss: bin
	cd blobssss && RUSTFLAGS="-C target-cpu=native" cargo build --bin blobssss --profile maxperf 
	rm -f bin/blobssss
	cp blobssss/target/maxperf/blobssss bin

bin/prometheus: bin
	cd prometheus && go build \
	    -buildmode=pie \
	    -mod=readonly \
	    -modcacherw \
	    -ldflags "-compressdwarf=false -linkmode external -extldflags '-Wl,-O1 -Wl,--sort-common -Wl,--as-needed -Wl,-z,relro -Wl,-z,now -Wl,-z,pack-relative-relocs'" \
	    ./cmd/prometheus
	rm -f bin/prometheus
	cp prometheus/prometheus bin


bin:
	mkdir bin

