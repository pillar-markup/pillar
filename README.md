# Pillar (P8)

Pillar is a markup syntax and tool-suite to generate documentation, books, websites and slides. Pillar is not new, it was invented around 2000 as a supporting language for [SmallWiki](https://www.slideshare.net/esug/smallwiki-smalltalk-wiki-towards-cms): one of the first wiki using OOP for real. Its ancestor was the markup for the Pier CMS and we extracted it from Pier to make it more applicable to different domains. The Pillar syntax is similar to markdown but its emphasis is on publishing and how it handles different types of links.

[![Build Status](https://travis-ci.org/pillar-markup/pillar.svg?branch=stable)](https://travis-ci.org/pillar-markup/pillar)
[![Documentation](https://img.shields.io/badge/Documentation-download-green.svg)](https://github.com/SquareBracketAssociates/Booklet-PublishingAPillarBooklet)

## Installation

### 1. Building from sources
For SSH setup, execute the `build.sh` script found in the `scripts` directory:

```bash
$ git clone git@github.com:pillar-markup/pillar.git
$ cd pillar
$ git checkout v8.0.2
$ chmod a+x ./scripts/build.sh
$ ./scripts/build.sh
```

### 1. Building from sources
For HTTPS setup, execute the `build.sh` script found in the `scripts` directory:

```bash
$ git clone https://github.com/pillar-markup/pillar.git
$ cd pillar
$ git checkout v8.0.2
$ chmod a+x ./scripts/build.sh
$ ./scripts/build.sh
```




The script will create a `build` directory in your current working directory with the pillar installation.

```bash
$ ls
LICENSE  README.md  appveyor.yml  archetypes  ==>>build<<==  download.sh  scripts  src
```


#### Current version

- Current version is Pillar v8.1.0
- Most Pharo booklets are using v7.7.4 and are under migration to v8.1.0.



### 2. Setting up the environment

You can then proceed to install that pillar build where you want.
For example, you can place it in a hidden directory in your home directory:

```bash
$ cd ..
$ mv pillar ~/.pillar
```

Then add that directory to the `PILLAR_HOME` and `HOME` environment variables, for example, by modifying your `.bashrc` with

```bash
export PILLAR_HOME="$HOME/.pillar"
export PATH="$PATH:$PILLAR_HOME/build"
```

### 3. Install external dependencies

You need to have a `LaTeX` installation in your machine. The simplest is to do a full installation, otherwise read below for a more tailored solution.

#### Installing `LaTeX` on OSX

The simplest installation is to do a full mactex installation. Just follow the instructions in https://www.tug.org/mactex/

#### Installing `LaTeX` on *nix

The simplest way to install `LaTeX` on unix is to install texlive-full in your system using your preferred package manager.

#### Installing `LaTeX` on Windows

Install a `LaTeX` distribution such as [MiKTeX](https://miktex.org/) and install the dependencies specified below using the provided package manager. Then, make sure the bin directory is in your PATH environment variable. For example this could be the following value:

```
C:\Program Files\MiKTeX 2.9\miktex\bin\x64
```

The automatic installer does this for you in general.

Also, latexmk on MiKTeX depends on a perl interpreter, that could be obtained via:

http://www.perl.org/get.html#win32

And requires to install this specific package MiKTeX package:
- supp-pdf

#### Tailored installation (for non-full lovers)
Producing pdf documents with Pillar requires a `LaTeX` installation with certain packages. 
Pillar 7.7.3 introduced the possibility to use LaTeX 2018 or the rolling version of 2019. 
Check the ensure-deps.sh files and companion travis file (if you want to run in travis) in the support/latex of the archetype.


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

#### All commands

Add the `-h` flag to get documentation.

**pillar build**
It builds by default the export format found in `pillar.conf` at `defaultExport` target.

**pillar archetype**

**pillar updateTemplate**

**pillar serve**

## Contributing to Pillar
The current pillar version is being developped using both [Pharo8.0](www.pharo.org).
To contribute, the easiest way to to follow the previous scripts and send PullRequests.
Use the latest dev-branch as a root for your changes.

## More documentation

Read the documentation at [https://github.com/SquareBracketAssociates/Booklet-PublishingAPillarBooklet](https://github.com/SquareBracketAssociates/Booklet-PublishingAPillarBooklet).
Please note that chapter on "Pharo a web Perspective" is obsolete since it refers to Pharo 60.

## History
- 8.0.2 current stable version. Tagged versions from 8.0.4 to 8.0.12 excluded got broken due to a class renaming. 8.0.12 is now green tests and loads. It is the future candidate for stable.
- 7.7.4 Last version before moving to P8.
- 7.7.3 introduces the possibility to use LaTeX 2018 or the rolling version of 2019. Check the ensure-deps.sh and companion travis file in the support/latex of the archetype.
- 7.7.0 cleaned useless features, plus travis builds. 
- 7.5.0 introduces environments (${begin:card|x=12}$ ... ${end:card}$
- 7.4.1 introduces element-based templating (templates found in a given folder are used to output one given element).

## Planned features
- Up to date documentation
- Remodularize packaging to be able to use Pillar inside Pharo for class/package comments.
- Integration with Citezen
- Introduce a markdown brand (to be able to do full roundtrip pillar <-> markdown <-> pillar). It will not cover every features of markdown and it will cover pillar core features: environment, extensible tags.
- Better templates for Web
- More components (blog)
- Reinitiate a small version of Pier to get live support
