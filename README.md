# Pillar

[![Build Status](https://travis-ci.org/pillar-markup/pillar.svg?branch=stable)](https://travis-ci.org/pillar-markup/pillar)

Pillar is a markup syntax and tool-suite to generate documentation, books and slides.

Read the documentation at [https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/PillarChap/Pillar.html](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/PillarChap/Pillar.html).
[Other formats](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifactbook-result/PillarChap/)

## Installation

### Get a pre-built version

Take a version from the github releases and download it.

You can get the latest release from [here](https://github.com/pillar-markup/pillar/releases).

Otherwise, these are other possible downloads:
- [V6.0.7](https://github.com/pillar-markup/pillar/archive/v6.0.7.zip)

### Building from sources

To install this version of pillar, clone this repository and call the `build.sh` script in it:

```bash
$ git clone git@github.com:pillar-markup/pillar.git -b stable
$ ./pillar/scripts/build.sh
```

That will create a `build` directory in the working directory and build pillar in there. You can then proceed to install pillar where you want in your home directory.
Here we place it as .pillar. 

```bash
$ mv build ~/.pillar
```
### Setting up your environment

Once you downloaded pillar and moved it to your home directory, 
then add that directory to the `PILLAR_HOME` and `HOME` environment variables, for example, by modifying your `.bashrc` with

```bash
export PILLAR_HOME="$HOME/.pillar"
export PATH="$PATH:$PILLAR_HOME"
```

## To compile a book in booklet format

```
pillar archetype book
make spiral
```

## Usage in Developement

Once built, you can use the artifact in the `build` directory to work. To finish setting up the development environment, do the following:
- configure the iceberg repository (using the `add local repository` option pointing to your git root)
- open your environment using `cd build && ./pharo-ui Pharo.image`

If you want to debug the pillar command line handlers you can invoke pillar using the `pillar-db` command that is right next to the `pillar` one. This command will open a graphical IDE that will allow you to debug and test properly.

```bash
$ pillar-db introspect something
```

## Dependencies

Producing pdf documents with pillar requires a `LaTeX` with the following packages:

- fira
- gentium-tug
- opensans
- varwidth
- footmisc
- tcolorbox
- environ
- trimspaces
- ctablestack
- import
- multirow

For this, the simplest way to install `LaTeX` is to install texlive-full in your system. Alternatively, you can use a docker install with everything prepackaged. 

```
https://github.com/cdlm/docker-texlive
```

Otherwise, you can do a manual `LaTeX` install in both linux and osx, as we do in our travis builds. Check our [ensure_latex](scripts/travis/ensure_latex.sh) and [ensure_book_dependencies](scripts/travis/ensure_book_dependencies.sh) scripts.
