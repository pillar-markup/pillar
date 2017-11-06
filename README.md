# Pillar

[![Build Status](https://travis-ci.org/pillar-markup/pillar.svg?branch=stable)](https://travis-ci.org/pillar-markup/pillar)

Pillar is a markup syntax and tool-suite to generate documentation, books and slides.

Read the documentation at [https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/PillarChap/Pillar.html](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/PillarChap/Pillar.html).
[Other formats](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifactbook-result/PillarChap/)

## Installation

To install this version of pillar, clone this repository and call the `build.sh` script in it:

```bash
$ git clone git@github.com:pillar-markup/pillar.git -b stable
$ ./pillar/build/build.sh
```

That will create a `build` directory in the working directory and build pillar in there. You can then proceed to install pillar where in your home:

```bash
$ mv build ~/.pillar
```

And then add that directory to the `PILLAR_HOME` and `HOME` environment variables, for example, by modifying your `.bashrc` with

```bash
export PILLAR_HOME="$HOME/.pillar"
export PATH="$PATH:$PILLAR_HOME"
```

## To compile a book in booklet format

```
./pillar archetype book
make spiral
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