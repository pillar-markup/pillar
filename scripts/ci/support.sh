#!/bin/bash
set -euo pipefail
trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR
IFS=$'\n\t'
# preamble from https://disconnected.systems/blog/another-bash-strict-mode/

# ensure meaningful default values for required environment variables
: "${TEXLIVE_RELEASE:=2018}"
: "${TEXLIVE_MIRROR:="https://ftp.tu-chemnitz.de/pub/tug/historic/systems/texlive/${TEXLIVE_RELEASE}/tlnet-final/"}"
: "${TEXLIVE_TARBALL:=install-tl-unx.tar.gz}"

function die() {
    echo "$@" >&2
    exit 1
}

function get-texlive-installer() {
    # download, checksum, extract
    curl --silent --location --remote-name "${TEXLIVE_MIRROR}/${TEXLIVE_TARBALL}"
    curl --silent --location "${TEXLIVE_MIRROR}/${TEXLIVE_TARBALL}.sha512" \
        | shasum --check -
    tar --extract --gzip --file "${TEXLIVE_TARBALL}"
}

function texlive-profile() {
    cat <<EOF
selected_scheme scheme-basic

TEXDIR          $HOME/texlive
TEXMFLOCAL      \$TEXDIR/texmf-local
TEXMFSYSCONFIG  \$TEXDIR/texmf-config
TEXMFSYSVAR     \$TEXDIR/texmf-var
TEXMFCONFIG     \$TEXMFSYSCONFIG
TEXMFHOME       \$TEXMFLOCAL
TEXMFVAR        \$TEXMFSYSVAR

instopt_adjustpath 0
instopt_adjustrepo 0
instopt_letter 0
instopt_portable 0
instopt_write18_restricted 1

# set repository:
tlpdbopt_autobackup 0
tlpdbopt_create_formats 1
tlpdbopt_generate_updmap 0
tlpdbopt_install_docfiles 0
tlpdbopt_install_srcfiles 0
tlpdbopt_post_code 1

EOF
}

function install-texlive() {
    local installer

    get-texlive-installer

    # find installer path from archive listing, sanity check
    installer="$(tar --list --gzip --file "${TEXLIVE_TARBALL}" | grep '/install-tl$' )"
    [[ -x "$installer" ]] || die "can not find TeXlive installer at ${installer}";

    texlive-profile >> texlive.profile
    "$installer" --repository "$TEXLIVE_MIRROR" --profile texlive.profile
    tlmgr install latexmk luatex85
}


function install-pillar() {
    ./pillar/scripts/build.sh > pillar-buikd.log 2>&1
}

function setup-pillar-ci() {
    export PATH="$HOME/texlive/bin/x86_64-linux:$HOME/pillar/build:$PATH"
    install-texlive
    install-pillar
}
