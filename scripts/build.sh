#!/usr/bin/env bash
# Bash3 Boilerplate. Copyright (c) 2014, kvz.io

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

# helper functions

function get_platform_identifier() {
  local TMP_OS=`uname | tr "[:upper:]" "[:lower:]"`
  if [[ "{$TMP_OS}" = *darwin* ]]; then
    echo "mac";
  elif [[ "{$TMP_OS}" = *linux* ]]; then
    echo "linux";
  elif [[ "{$TMP_OS}" = *win* ]]; then
    echo "win";
  elif [[ "{$TMP_OS}" = *mingw* ]]; then
    echo "win";
  elif [[ "{$TMP_OS}" = *msys* ]]; then
    echo "win";
  else
    echo "Unsupported OS";
    exit 1;
  fi
}

# Set magic variables for current file & dir
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__builddir="$(pwd)/build"
PHARO_VERSION=61+vm
PHARO="./pharo Pharo.image"

rm -rf "${__builddir}" && mkdir -p "${__builddir}" && cd "${__builddir}"
wget -O - get.pharo.org/61+vm | bash

REPOSITORY_PATH=${__dir}/../src
OS=$(get_platform_identifier)
if [ "$OS" == "win" ]; then
    REPOSITORY_PATH=$(cygpath $REPOSITORY_PATH --windows)
fi

${PHARO} eval --save "Metacello new baseline: 'Pillar'; repository: 'filetree://${REPOSITORY_PATH}'; load"

${PHARO} eval --save "Deprecation raiseWarning: false."
${PHARO} eval --save "Deprecation showWarning: false."
${PHARO} eval --save "StartupPreferencesLoader allowStartupScript: false."

# UserManager was remove on Pharo5. We need to check if there is an other way to do this.
${PHARO} eval --save "PharoFilesOpener default unsetInformAboutReadOnlyChanges."
${PHARO} eval --save "Smalltalk logFileName: '/tmp/pillar.log'"

cp "${__dir}/wrappers/"* "${__builddir}"
cp -r "${__dir}/../archetypes" "${__builddir}/archetypes"