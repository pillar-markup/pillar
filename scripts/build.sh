#!/usr/bin/env bash
# Bash3 Boilerplate. Copyright (c) 2014, kvz.io

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

# Set magic variables for current file & dir
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__builddir="$(pwd)/build"

PHARO_VERSION=61+vm

rm -rf "${__builddir}" && mkdir -p "${__builddir}" && cd "${__builddir}"

wget --quiet -O - get.pharo.org/${PHARO_VERSION} | bash
PHARO="./pharo Pharo.image"
${PHARO} eval --save "Metacello new baseline: 'Pillar'; repository: 'filetree://${__dir}/../src'; load"

${PHARO} eval --save "Deprecation raiseWarning: false."
${PHARO} eval --save "Deprecation showWarning: false."
${PHARO} eval --save "StartupPreferencesLoader allowStartupScript: false."

# UserManager was remove on Pharo5. We need to check if there is an other way to do this.
${PHARO} eval --save "PharoFilesOpener default unsetInformAboutReadOnlyChanges."
${PHARO} eval --save "Smalltalk logFileName: '/tmp/pillar.log'"

cp "${__dir}/wrappers/*" "${__builddir}"
cp -r "${__dir}/../archetypes" "${__builddir}/archetypes"