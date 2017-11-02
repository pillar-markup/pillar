# Install Fira Mono as needed by pillar on travis
# Follow instructions on the following gist: https://gist.github.com/muammar/a5ffb635eb7f532346a8e777b847f8a7

if [[ ${TRAVIS_OS_NAME} == "osx"   ]]; then
  brew update;
  brew install basictex;
  unzip 4.202.zip;
  font_dir="$HOME/Library/Fonts";
  mkdir -p $font_dir;
  cp Fira-4.202/otf/* $font_dir/;
elif [[ ${TRAVIS_OS_NAME} == "linux" ]]; then
  wget "http://www.carrois.com/downloads/fira_mono_3_2/FiraMonoFonts3206.zip";
  unzip FiraMono3206.zip;
  mkdir -p ~/.fonts
  cp Fira*/WEB/TTF/*.ttf ~/.fonts;
  cp Fira*/OTF/Fira* ~/.fonts;
  fc-cache -fv;
  luaotfload-tool --update;
fi
