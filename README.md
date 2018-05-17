# Pillar

Pillar is a markup syntax and tool-suite to generate documentation, books, websites and slides.

[![Build Status](https://travis-ci.org/pillar-markup/pillar.svg?branch=stable)](https://travis-ci.org/pillar-markup/pillar)
[![Documentation](https://img.shields.io/badge/Documentation-download-green.svg)](https://bintray.com/squarebracketassociates/wip/download_file?file_path=DistributingPillar-wip.pdf)

## Installation

### 1. Building from sources

Execute the `build.sh` script found in the `scripts` directory:

```bash
$ git clone git@github.com:pillar-markup/pillar.git
$ ./pillar/scripts/build.sh
```

The script will create a `build` directory in your current working directory with the pillar installation.

```bash
$ ls
build pillar
```

#### Getting an older version

- *v5.0:* Pillar 5 is released for Pharo5 and versionned on [SmalltalkHub](http://smalltalkhub.com/#!/~Pier/Pillar).
  - You can get an already built image of that version from [here](https://github.com/pillar-markup/pillar/releases/tag/v5.0).
  - You can check the scripts in the (dev-5 branch)[https://github.com/pillar-markup/pillar/tree/dev-5]
  - The root of this branch still contains for backwards compatibility purposes a _deprecated_ copy of the old `download.sh` script.


### 2. Setting up the environment

You can then proceed to install that pillar build where you want.
For example, you can place it in a hidden directory in your home directory:

```bash
$ mv Pillar ~/.pillar
```

Then add that directory to the `PILLAR_HOME` and `HOME` environment variables, for example, by modifying your `.bashrc` with

```bash
export PILLAR_HOME="$HOME/.pillar/build"
export PATH="$PATH:$PILLAR_HOME"
```

### 3. Install external dependencies

Producing pdf documents with pillar requires a `LaTeX` installation with at least the following packages:

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

#### *nix specificities

The simplest way to install `LaTeX` is to install texlive-full in your system. Alternatively, you can use a docker install with everything prepackaged. 

```
https://github.com/cdlm/docker-texlive
```

Otherwise, you can do a manual `LaTeX` install in both linux and osx, as we do in our travis builds. Check our [ensure_latex](scripts/travis/ensure_latex.sh) and [ensure_book_dependencies](scripts/travis/ensure_book_dependencies.sh) scripts.

#### Windows specificities

Install a `LaTeX` distribution such as [MiKTeX](https://miktex.org/) and install the dependencies specified above using the provided package manager. Then, make sure the bin directory is in your PATH environment variable. For example this could be the following value:

```
C:\Program Files\MiKTeX 2.9\miktex\bin\x64
```

The automatic installer does this for you in general.

Also, latexmk on MiKTeX depends on a perl interpreter, that could be obtained via:

http://www.perl.org/get.html#win32

And requires to install this specific package MiKTeX package:
- supp-pdf

### 4. Test your installation

To test your pillar installation, open a new terminal and execute the `pillar --version` command.
If everything is ok, that should print out (as in the current version) the version of the Pharo VM.
For example:

```bash
$  pillar --version
M:    CoInterpreter VMMaker.oscog-eem.2265 uuid: 76b62109-629a-4c39-9641-67b53321df9a Aug 27 2017
StackToRegisterMappingCogit VMMaker.oscog-eem.2262 uuid: 8b531242-de02-48aa-b418-8d2dde0bec6c Aug 27 2017
VM: 201708271955 https://github.com/OpenSmalltalk/opensmalltalk-vm.git $ Date: Sun Aug 27 21:55:26 2017 +0200 $ Plugins: 201708271955 https://github.com/OpenSmalltalk/opensmalltalk-vm.git $

```

## Getting started

To create a book, you can start by installing the book archetype in a directory where you want to manage it:

```
$ mkdir my-new-book
$ cd my-new-book
$ pillar archetype book
```

You can then edit the pillar files and the pillar configuration file `pillar.conf`.
Finally, you can generate your book in pdf using.

```
$ pillar build pdf
```

Or in html:

```
$ pillar build html
```

The resulting pdf or html site will be written into the `_result` directory.

## Contributing to Pillar

The current pillar version is being developped using both [Pharo6.1](www.pharo.org) and [Pharo7.0](www.pharo.org).
To contribute, you should set-up a development environment as follows:

1. Download Pharo 32bits from Pharo's website (64 bits is on the way). You can also use the handy zeroconf scripts as follows:

```bash
$ wget get.pharo.org/61+vm | bash     #32bit version
```

2. Open Pharo

```bash
$ ./pharo-ui Pharo.image
```

3. Check that you have your ssh keys in-sync with github (You can follow github instructions from here https://help.github.com/articles/connecting-to-github-with-ssh/). If you skip this, you'll have problems fetching and pushing your commits.

4. If you chose Pharo6.1, update iceberg to the latest version using the script in [Iceberg's README](https://github.com/pharo-vcs/iceberg/blob/master/README.md)

5. Clone pillar using iceberg and install the baseline using the metacello plugin.

## More documetation

Read the documentation at https://github.com/SquareBracketAssociates/Booklet-PublishingAPillarBooklet.
Please note that chapter on Pharo a web Perspective is obsolete since it refers to Pharo 60.