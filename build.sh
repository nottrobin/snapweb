#!/bin/sh

set -e

builddir=$(mktemp -d)
trap 'rm -rf "$builddir"' EXIT

cp -r www pkg/. $builddir
cd $builddir

go build launchpad.net/clapper/cmd/snappyd

cd -

snappy build $builddir