# Pillar

<a href="https://www.pharo.org">
    <img alt="Pharo" src="https://img.shields.io/static/v1?style=for-the-badge&message=Pharo&color=3297d4&logo=Harbor&logoColor=FFFFFF&label=" />
</a>

Pillar is a documentation compilation chain taking documents written in Microdown (and Pillar) and producing books and slides.

Pillar is now the name of the compilation chain and the syntax language is Microdown. 

## History

Pillar was a markup syntax and tool-suite to generate documentation, books, websites and slides. Pillar as a markup is not new, it was invented around 2000 as a supporting language for [SmallWiki](https://www.slideshare.net/esug/smallwiki-smalltalk-wiki-towards-cms): one of the first wiki using OOP for real. Its syntax was based on the one of the original Wiki from Ward Cunningham. From SmallWiki it became the markup of the Pier CMS (which was an application server written in Seaside). 
Then we extracted it from Pier to make it more applicable to different domains. 
In recent years we migrated all the transformation logic (parser, asts, visitors to Microdown). 
The Pillar markup has been retired from the compilation chain. Now Pillar edition chain only supports Microdown syntax.

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://img.shields.io/badge/license-MIT-blue.svg)

## Installation

### 1. Building from sources
For HTTPS setup, execute the `build.sh` script found in the `scripts` directory:

### Here is the latest version for Pharo 13.

Lean Pillar only Microdown format
```bash
$ git clone https://github.com/pillar-markup/pillar.git
$ cd pillar
$ git checkout v11.0.1
$ chmod a+x ./scripts/build.sh
$ ./scripts/build.sh
```


With pillar format support
```bash
$ git clone https://github.com/pillar-markup/pillar.git
$ cd pillar
$ git checkout v10.4.5
$ chmod a+x ./scripts/build.sh
$ ./scripts/build.sh
```


### Here is the latest version for Pharo 12.
```bash
$ git clone https://github.com/pillar-markup/pillar.git
$ cd pillar
$ git checkout v10.4.3
$ chmod a+x ./scripts/build.sh
$ ./scripts/build.sh
```

### Here is the latest version for Pharo 11.
```bash
$ git clone https://github.com/pillar-markup/pillar.git
$ cd pillar
$ git checkout v9.0.1
$ chmod a+x ./scripts/build.sh
$ ./scripts/build.sh
```


### Here is the latest version for Pharo 10.
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
- or add the build folder into your `PATH` environment variable, for example by adding into your `.bashrc` (or shell startup):
```bash
export PATH="$PATH:$PILLAR_HOME/build"
```

### 3. Install external dependencies

You need to have a `LaTeX` installation in your machine. The simplest is to do a full installation, otherwise read below for a more tailored solution.

#### Installing `LaTeX` on OSX

The simplest installation is to do a full Mactex installation. Just follow the instructions in https://www.tug.org/mactex/

#### Installing `LaTeX` on *nix

The simplest way to install `LaTeX` on unix is to install texlive-full in your system using your preferred package manager.

#### Installing `LaTeX` on Windows

Install a `LaTeX` distribution such as [MiKTeX](https://miktex.org/) and install the dependencies specified below using the provided package manager. Then, make sure the bin directory is in your PATH environment variable. For example this could be the following value:

#### Tailored installation (for non-full lovers)
Producing pdf documents with Pillar requires a `LaTeX` installation with certain packages.
Check the ensure-deps.sh files and the support/latex.

## Getting started

To create a book, you can start by installing the book archetype in a directory where you want to manage it:

```
$ mkdir my-new-book
$ cd my-new-book
$ pillar archetype bod-book
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

- **pillar build** builds by default the export format found in `pillar.conf` at `defaultExport` target.
- **pillar archetype** installs the archetype
- **pillar check** launches all the book checkers defined in the configuration.

## Contributing to Pillar

The current pillar version is being developed using [Pharo13](www.pharo.org).
To contribute, the easiest way to to follow the previous scripts and send PullRequests.
Use the latest dev as a root for your changes.

### Cleaning first 

First remove existing packages from the Pharo distribution.

```
#( 'Microdown' 'BeautifulComments' 'DocumentBrowser' ) do: [ :name |
		(IceRepository repositoryNamed: name)
			ifNil: [ self inform: 'Project not found: ' , name ]
			ifNotNil: [ :found |
				found
					unload;
					forget ] ].

Smalltalk globals
	at: #BaselineOfMicrodown 
	ifPresent: [ :c | c removeFromSystem ].
```

Then load the dev branch of Pillar, it should also load the dev branch of Microdown so that you can work on both projects when they need to be in sync. 

```
Metacello new
	baseline: 'Pillar';
	repository: 'github://pillar-markup/pillar:xxx/src';
	onConflict: [ :ex | ex useIncoming ];
	onUpgrade: [ :ex | ex useIncoming ];
	load: #('All').
```


The following script can be useful if you develop using the launcher and want to try to execute the image as from a pillar command

```
..../Pharo/vms/100-x64/Pharo.app/Contents/MacOS/Pharo  ..../Pharo/images/P11-PillarRealReference/P10-PillarRealReference.image clap archetype welcome

..../Pharo/vms/100-x64/Pharo.app/Contents/MacOS/Pharo  ..../Pharo/images/P11-PillarRealReference/P10-PillarRealReference.image clap build pdf index.md
```





## History

The development of Pillar and Microdown are now in Pharo 13.


### For Pharo 13
- v11
	- Removing Pillar syntax support.
 	- Using more recent version of Microdown.
  	- Better support for book checkers.
  	- On the way to use a templating microdown approach (so that user can customise the output at the document element level).
  	  
- v10.4.5 [ Pharo 13 - Pillar & Microdown syntax ]
	- Revisit all commands and make them work in Pharo13
 	- Latest version with Pillar syntax	 	

- v10.4.4 bogus
### For Pharo 12 

- v10.4.3 [Use MicWriter for HTML output]

- v10.4.2 [Last version supporting Pillar documents]
	- Use Microdown generators
	- Mustache v1.3
	- Microdown v2.9.2
- v10.4.0
	- Cleaned archetypes
  	- New documentation inside the bod-book template with the full syntax explained. 
	- Uses Microdown V2.7.1: introduces new elements to support Foliage and web generation. It improves the document checker. Now the following analyses are reported: duplicated anchors, references to unexisting anchors, unreferenced figures, missing figure files, and missing input files.
	- It has been tested with the bod-book updated archetype.
	
- v10.2.0
	- New book checkers: checks for undefined or duplicated anchors, bogus inputfile
	- Support for slides as header e.g. # a nice title
	- Conversion of slides from pillar to Microdown
	- Nicer support for extension e.g. {!comment|contents=sd thinks there is something fishy!} now can be expressed as {!comment|sd thinks there is something fishy!}`
	- Cleaned book. Now pillar archetype bod-book can fully build on GH - check the workflows files that are automatically installed.
	- Two new archetypes are proposed: microdown-mooc and microdown-headerformat-mooc.
	- Support for github actions with LaTeX.

- v10.1.0 
Introduces new template for slides - microdown-mooc (based on extension <!slide...!>) and microdown-headerformat-mooc (using top-level header as slide definition marker. It uses Microdown v2.5.5.
- v10.0.1 Introduces figure arguments in caption instead of url for better integration with Github.
- v10.0.0 bug fix with some links problems due to new inline parser.

### For Pharo 11 
- v9.0.1 Fixing link problems.
- v9.0.0 loading in Pharo 11.

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
- Take advantage of booktester
- Check Macrodown and Foliage
- Stronger support for math
- Use Templating for LaTeX
- Integration with Citezen
- Better templates for Web
- New markup for natural nesting (not forcing closing markup)

## Old and obsolete documentation

Read the documentation at [https://github.com/SquareBracketAssociates/Booklet-PublishingAPillarBooklet](https://github.com/SquareBracketAssociates/Booklet-PublishingAPillarBooklet).
Please note that chapter on "Pharo a web Perspective" is obsolete since it refers to Pharo 60.

