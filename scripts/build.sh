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

function get_platform_wrapper_selector() {
  local TMP_OS=`uname | tr "[:upper:]" "[:lower:]"`
  if [[ "{$TMP_OS}" = *darwin* ]]; then
    echo "nixes";
  elif [[ "{$TMP_OS}" = *linux* ]]; then
    echo "nixes";
  elif [[ "{$TMP_OS}" = *win* ]]; then
    echo "windows";
  elif [[ "{$TMP_OS}" = *mingw* ]]; then
    echo "windows";
  elif [[ "{$TMP_OS}" = *msys* ]]; then
    echo "windows";
  else
    echo "Unsupported OS";
    exit 1;
  fi
}


# Set magic variables for current file & dir
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__builddir="$(pwd)/build"
PHARO_VERSION="${PHARO_VERSION:-80}"

OS=$(get_platform_identifier)
REPOSITORY_PATH=${__dir}/../src
PHARO_ARCH="64"
if [ "$OS" == "win" ]; then	
	PHARO_ARCH="32"
    REPOSITORY_PATH=$(cygpath $REPOSITORY_PATH --windows)
fi


PHARO="./pharo Pharo.image --no-default-preferences"

rm -rf "${__builddir}" && mkdir -p "${__builddir}" && cd "${__builddir}"
wget -O - get.pharo.org/${PHARO_ARCH}/${PHARO_VERSION}+vm | bash


${PHARO} eval --save "Metacello new baseline: 'Pillar'; repository: 'gitlocal://${REPOSITORY_PATH}'; load"

${PHARO} eval --save "Deprecation raiseWarning: false."
${PHARO} eval --save "Deprecation showWarning: false."
${PHARO} eval --save "StartupPreferencesLoader allowStartupScript: false."

# UserManager was remove on Pharo5. We need to check if there is an other way to do this.
${PHARO} eval --save "PharoFilesOpener default unsetInformAboutReadOnlyChanges."
${PHARO} eval --save "Smalltalk logFileName: '/tmp/pillar.log'"
WRAPPER_SELECTOR=$(get_platform_wrapper_selector)
cp "${__dir}/wrappers/$WRAPPER_SELECTOR/"* "${__builddir}"
cp -r "${__dir}/../archetypes" "${__builddir}/archetypes"
