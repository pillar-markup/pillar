# Pillar

[![Build Status](https://travis-ci.org/pillar-markup/pillar.svg?branch=stable)](https://travis-ci.org/pillar-markup/pillar)

Pillar is a markup syntax and tool-suite to generate documentation, books and slides.

Read the documentation at [https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/PillarChap/Pillar.html](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/PillarChap/Pillar.html).
[Other formats](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifactbook-result/PillarChap/)

## Installation

### Get a pre-built version

Take a version from the github releases and download it.

You can get the latest release from [here](https://github.com/pillar-markup/pillar/releases).
Pay attention the latest release is 6.0.7 (and not 5.0). 

Otherwise, these are other possible downloads:
- [V6.0.7](https://github.com/pillar-markup/pillar/archive/v6.0.7.zip)

### Building from sources

To install this version of pillar, clone this repository and call the `build.sh` script in it:

```bash
$ mkdir Pillar
$ cd Pillar
$ git clone git@github.com:pillar-markup/pillar.git -b newpipeline
$ ./pillar/scripts/build.sh
```

That will create a `build` directory in the working directory and build pillar in there. You can then proceed to install pillar where you want in your home directory.
Here we place it as .pillar. 

```bash
$ mv Pillar ~/.pillar
```
### Setting up your environment

Once you downloaded pillar and moved it to your home directory, 
then add that directory to the `PILLAR_HOME` and `HOME` environment variables, for example, by modifying your `.bashrc` with

```bash
export PILLAR_HOME="$HOME/.pillar/build"
export PATH="$PATH:$PILLAR_HOME"
```


## To compile a book in booklet format
Now you should be ready compile the default 

```
pillar archetype book
pillar build pdf
```
It will build a book in the folder _result. Pay attention for the moment 
running it twice break and you should remove the _result to regenerate a book pdf. 

## Manage your own book
Now you can copy the following files and folder to your own repository. 
Chapters, figures, pillar.conf, book.pillar, and _support
These are the files that you should versionned. 



## Contributing to Pillar

The current pillar version is being developped using [Pharo6.1](www.pharo.org). To contribute, you should set-up a development environment as follows:

1. Download Pharo6.1, either 32 or 64 bits, from Pharo's website. You can also use the handy zeroconf scripts as follows:

```bash
$ wget get.pharo.org/61+vm | bash     #32bit version
$ wget get.pharo.org/64/61+vm | bash  #64bit version
```

2. Open Pharo

```bash
$ ./pharo-ui Pharo.image
```

3. Check that you have your ssh keys in-sync with github (You can follow github instructions from here https://help.github.com/articles/connecting-to-github-with-ssh/). If you skip this, you'll have problems fetching and pushing your commits.

4. Clone pillar using iceberg.

## Notes about dependencies

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
- listings
- url
- import

### *nix specificities

The simplest way to install `LaTeX` is to install texlive-full in your system. Alternatively, you can use a docker install with everything prepackaged. 

```
https://github.com/cdlm/docker-texlive
```

Otherwise, you can do a manual `LaTeX` install in both linux and osx, as we do in our travis builds. Check our [ensure_latex](scripts/travis/ensure_latex.sh) and [ensure_book_dependencies](scripts/travis/ensure_book_dependencies.sh) scripts.

### Windows specificities

Install a `LaTeX` distribution such as [MiKTeX](https://miktex.org/) and install the dependencies specified above using the provided package manager. Then, make sure the bin directory is in your PATH environment variable. For example this could be the following value:

```
C:\Program Files\MiKTeX 2.9\miktex\bin\x64
```

The automatic installer does this for you in general.

Also, latexmk on MiKTeX depends on a perl interpreter, that could be obtained via:

http://www.perl.org/get.html#win32

And requires to install this specific package MiKTeX package:
- supp-pdf
