#!/bin/bash

set -eo pipefail

eval `opam config env`
export PATH=/home/opam/.cargo/bin:/usr/lib/go/bin:$PATH
export GO=/usr/lib/go/bin/go

CODA_COMMIT_SHA1=$(git rev-parse HEAD)

echo "--- Explicitly generate PV-keys and upload before building"
make build_or_download_pv_keys 2>&1 | tee /tmp/buildocaml.log

echo "--- Publish pvkeys"
./scripts/publish-pvkeys.sh

# TODO: Stop building lib_p2p multiple times by pulling from buildkite-agent artifacts or docker or somewhere
echo "--- Build libp2p_helper TODO: use the previously uploaded build artifact"
LIBP2P_NIXLESS=1 make libp2p_helper

echo "--- Build generate-keypair binary"
dune build --profile=${DUNE_PROFILE} src/app/generate_keypair/generate_keypair.exe 2>&1 | tee /tmp/buildocaml2.log

echo "--- Build runtime_genesis_ledger binary"
dune exec --profile=${DUNE_PROFILE} src/app/runtime_genesis_ledger/runtime_genesis_ledger.exe

echo "--- Generate runtime_genesis_ledger with 10k accounts"
dune exec --profile=${DUNE_PROFILE} src/app/runtime_genesis_ledger/runtime_genesis_ledger.exe -- --config-file genesis_ledgers/phase_three/config.json

echo "--- Upload genesis data"
./scripts/upload-genesis.sh

echo "--- Build logproc + coda"
echo "Building from Commit SHA: $CODA_COMMIT_SHA1"
dune build --profile=${DUNE_PROFILE} src/app/logproc/logproc.exe src/app/cli/src/coda.exe 2>&1 | tee /tmp/buildocaml3.log

echo "--- Build deb package with pvkeys"
make deb

echo "--- Store genesis keys"
make genesiskeys

echo "--- Upload deb to repo"
make publish_debs

echo "--- Copy artifacts to cloud"
# buildkite-agent artifact upload occurs outside of docker after this script exits

# TODO save docker cache
