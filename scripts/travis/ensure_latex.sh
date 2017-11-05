#!/bin/bash
# From https://github.com/y-yu/install-tex-travis/blob/master/install-tex.sh
set -e

DIRNAME=tl-`date +%Y_%m_%d_%H_%M_%S`

echo "make the install directory: $DIRNAME"
mkdir $DIRNAME
cd $DIRNAME

wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar zxvf install-tl-unx.tar.gz
cd install-tl-*

BASE_PROFILE=$(cat << EOS
selected_scheme scheme-small
TEXDIR $HOME/texlive/2017
TEXMFCONFIG $HOME/.texlive2017/texmf-config
TEXMFHOME $HOME/texmf
TEXMFLOCAL $HOME/texlive/texmf-local
TEXMFSYSCONFIG $HOME/texlive/2017/texmf-config
TEXMFSYSVAR $HOME/texlive/2017/texmf-var
TEXMFVAR $HOME/.texlive2017/texmf-var
option_doc 0
option_src 0
EOS
)

if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
  echo "$BASE_PROFILE\nbinary_x86_64-darwin 1" > ./small.profile
  export PATH=$PATH:$HOME/texlive/2017/bin/x86_64-darwin
else
  echo "$BASE_PROFILE\nbinary_x86_64-linux 1" > ./small.profile
  export PATH=$PATH:$HOME/texlive/2017/bin/x86_64-linux
fi

./install-tl -profile ./small.profile -repository http://ctan.sharelatex.com/tex-archive/systems/texlive/tlnet
tlmgr init-usertree
tlmgr install latexmk
tlmgr install luatex85

cd ../..

echo "remove the install directory"
rm -rf $DIRNAME