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
    local tldir

    # download and checksum
    curl --silent --location --remote-name "${TEXLIVE_MIRROR}/${TEXLIVE_TARBALL}"
    curl --silent --location "${TEXLIVE_MIRROR}/${TEXLIVE_TARBALL}.sha512" \
        | shasum --check -

    # extract and grab name of tarball root
    read -rd/ tldir < <(
        tar --extract --ungzip --verbose --file "${TEXLIVE_TARBALL}"
    )

    # sanity check
    [ -x "$tldir/install-tl" ] || die "can not find TeXlive installer at $tldir/install-tl"
    echo "$tldir/install-tl"
}

function fold() {
    local fold_name="$1"
    shift # rest is command to run inside the fold

    travis_fold start "$fold_name"
    "$@"
    travis_fold end "$fold_name"
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
tlpdbopt_location $TEXLIVE_MIRROR
tlpdbopt_sys_bin $HOME/bin
tlpdbopt_autobackup 0
tlpdbopt_create_formats 1
tlpdbopt_generate_updmap 0
tlpdbopt_install_docfiles 0
tlpdbopt_install_srcfiles 0
tlpdbopt_post_code 1

EOF
}

function install-base() {
    local installer
    installer="$(get-texlive-installer)"

    texlive-profile >> texlive.profile

    # fold "install TeXlive $TEXLIVE_RELEASE" \
         "$installer" --repository "$TEXLIVE_MIRROR" --profile texlive.profile
}

function install-dependencies() {
    tlmgr install latexmk luatex85
}

function install-texlive() {
    export PATH="$HOME/bin:$PATH"
    install-base
    install-dependencies
}
