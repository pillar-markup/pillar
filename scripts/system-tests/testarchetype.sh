#!/usr/bin/env bash
# Bash3 Boilerplate. Copyright (c) 2014, kvz.io

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

# Set magic variables for current file & dir
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__builddir="$(pwd)/build"

${__dir}/../build.sh

# Download Archetype
mkdir -p test && cd test
${__builddir}/pillar archetype $1

# Build book
${__builddir}/pillar build $2