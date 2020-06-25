"
Clap Command to build files

# Usage examples

To build a book pdf: `./pharo-ui Pillar.image pillar build pdf`

To use a template: `./pharo-ui Pillar.image pillar build --templatable html`

To use a specific build strategy:
- `pillar build -a pdf` >> build all Pillar documents found in directory
- `pillar build -m pdf` >> default build, only index.pillar is build

**NOTE:** there is no flag for ""list"" as buildList is called only if files are given as positionals after format

# How to add a new export format?
This method is based on existing writing targets and generate a CLAP command for each one.
1. Create your target as a subclass of `PRWritingTarget` with the name: `PRxxxxxxOutput`
2. Associate and create if needed, a PRDocument and a Writer
"
Class {
	#name : #ClapPillarBuildCommand,
	#superclass : #ClapPillarCommand,
	#category : #'Pillar-Cli-Clap'
}

{ #category : #accessing }
ClapPillarBuildCommand class >> commandName [
	^'build'
]

{ #category : #'command line' }
ClapPillarBuildCommand class >> commandSpecification [
	<commandline>
	
	| defaultCommand  |
		
	defaultCommand := self new project defaultTarget buildClapCommandWithId: #build withPositionals: false.
	PRTarget clapCommandList do: [ :c | defaultCommand addSubcommand: c ].
	
	^ defaultCommand
]
