# Pillar

Pillar is a markup syntax and tool-suite to generate documentation, books, websites and slides. Pillar is not new, it was invented around 2000 as a supporting language for [SmallWiki](https://www.slideshare.net/esug/smallwiki-smalltalk-wiki-towards-cms): one of the first wiki using OOP for real. Its ancestor was the markup for the Pier CMS and we extracted it from Pier to make it more applicable to different domains. The Pillar syntax is similar to markdown but its emphasis is on publishing and how it handles different types of links.

Now in the latest version Pillar we are supporting Microdown syntax and migrating all the support to Microdown while supporting the Pillar syntax for backward compatibility reasons. We can migrate automatically books from Pillar syntax to Microdown syntax (compatible with markdown). 

In the future Pillar will be the name of the compilation chain and the syntax language will be Microdown. 

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://img.shields.io/badge/license-MIT-blue.svg)
![https://github.com/pillar-markup/pillar/workflows/unit.app/badge.svg](https://github.com/pillar-markup/pillar/workflows/unit.app/badge.svg)
![https://github.com/pillar-markup/pillar/workflows/unitTests/badge.svg](https://github.com/pillar-markup/pillar/workflows/unitTests/badge.svg)

![https://github.com/pillar-markup/pillar/workflows/system/badge.svg](https://github.com/pillar-markup/pillar/workflows/system/badge.svg)
![https://github.com/pillar-markup/pillar/workflows/integration.app/badge.svg](https://github.com/pillar-markup/pillar/workflows/integration.app/badge.svg)

[![Coverage Status](https://coveralls.io/repos/github/pillar-markup/pillar/badge.svg?branch=dev-8)](https://coveralls.io/github/pillar-markup/pillar?branch=dev-8)

## Installation

### 1. Building from sources
For HTTPS setup, execute the `build.sh` script found in the `scripts` directory:

```bash
$ git clone https://github.com/pillar-markup/pillar.git
$ cd pillar
$ git checkout v8.3.2
$ chmod a+x ./scripts/build.sh
$ ./scripts/build.sh
```




The script will create a `build` directory in your current working directory with the pillar installation.

```bash
$ ls
LICENSE  README.md  appveyor.yml  archetypes  ==>>build<<==  download.sh  scripts  src
```

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
```

To make the `pillar` command available in your shell you can:
- either symlink the `pillar` script into your `~/bin` (or `~/.local/bin` on some environments) folder using:
```bash
ln -s $PILLAR_HOME/build/pillar ~/bin/pillar
```
- or add the build folder into the your `PATH` envirnment variable, for example by adding into your `.bashrc` (or shell startup):
```bash
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
The current pillar version is being developped using [Pharo11](www.pharo.org).
To contribute, the easiest way to to follow the previous scripts and send PullRequests.
Use the latest dev-8 as a root for your changes.

The following script can be useful if you develop usin the launcher and want to try to execute the image as from a pillar command

```
/Users/ducasse/Documents/Pharo/vms/100-x64/Pharo.app/Contents/MacOS/Pharo  /Users/ducasse/Documents/Pharo/images/P11-PillarRealReference/P10-PillarRealReference.image clap build pdf index.pillar
```

## More documentation

Read the documentation at [https://github.com/SquareBracketAssociates/Booklet-PublishingAPillarBooklet](https://github.com/SquareBracketAssociates/Booklet-PublishingAPillarBooklet).
Please note that chapter on "Pharo a web Perspective" is obsolete since it refers to Pharo 60.

## History

### For Pharo 11
- v9.0.0 loading in Pharo 11. The development will now happen in P11.

### For Pharo 10
- v8.3.2 fixed baseline and updated readme
- 8.3.0 full support for microdown and pillar books using MD v2.3.1
- 8.2.7 [Bogus] full support for microdown and pillar books (but it did load the correct version of microdown)
- 8.2.6 [Bogus] full support for microdown and pillar books (but it did load the correct version of microdown)
- 8.2.4-5 introduced hooks for file include in Pillar and microdown
- 8.2.3 remove temporary PRMicrodownWriter (since it was ported to MicrodownV2)
- 8.2.2 
-- cache table of contents to avoid quadratic search
-- Ready for P10 SubOSProcess 1.4, ifError:  
- 8.2.1 remove pillar before loading
- 8.2.0 Change microdownDev to Microdown 1.0.0
- 8.0.15 
- 8.0.12 Tagged versions from 8.0.4 to 8.0.12 excluded got broken due to a class renaming. 8.0.12 is now green tests and loads. It is the future candidate for stable.
- 7.7.4 Last version before moving to P8.
- 7.7.3 introduces the possibility to use LaTeX 2018 or the rolling version of 2019. Check the ensure-deps.sh and companion travis file in the support/latex of the archetype.
- 7.7.0 cleaned useless features, plus travis builds.
- 7.5.0 introduces environments (${begin:card|x=12}$ ... ${end:card}$
- 7.4.1 introduces element-based templating (templates found in a given folder are used to output one given element).

## Planned development
- Release new Pillar for Pharo11.
- Check Seaside book conversion bug
- Check dev version of Microdown with new inline parser: when working, freeze MD with a new tagged version and freeze a new Pillar version. 
- Check support for math
- Use Templating for LaTeX
- Remodularize packaging to be able to use Pillar inside Pharo for class/package comments.
- Integration with Citezen
- Better templates for Web
- More components - Simple blog
