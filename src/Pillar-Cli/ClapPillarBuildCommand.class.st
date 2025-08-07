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
	#name : 'ClapPillarBuildCommand',
	#superclass : 'ClapPillarCommand',
	#instVars : [
		'strategy'
	],
	#category : 'Pillar-Cli-Clap',
	#package : 'Pillar-Cli',
	#tag : 'Clap'
}

{ #category : 'accessing' }
ClapPillarBuildCommand class >> commandName [
	^'build'
]

{ #category : 'command line' }
ClapPillarBuildCommand class >> commandSpecification [

	<commandline>
	^ (ClapCommandSpec id: #build)
		  description: 'Build your Pillar documents in the specified format';
		  commandClass: self;
		  addHelp;
		  addFlag: #templatable description: 'Use a template';
		  addFlag: #all description: 'Build all Pillar documents in repository';
		  addFlag: #mainRoot description: 'Build index.md in root directory';
			" it can only be optional if we do not specify the file so better not support
			pillar build
			and 
			pillar build pdf index.md this is too confusing. 
			May be format should be a subcommand for now make it work the same way as before using a positional"
		  addPositional: #format spec: [ :positional |
    		 positional      		
		     	description: 'The format you want pdf is the default'
		  	  	]; 
		"addFlagWithPositional: #format description: 'output format'; was forcing to use --format "
		  addPositional: #requestedFiles spec: [ :positional |
    		 positional      		
		     	description: 'Pillar files you want to build';
			   defaultValue: [ #('index.md') ];
		  	  	multiple: true ];
		  yourself
]

{ #category : 'execution' }
ClapPillarBuildCommand >> execute [

	| target |
	target := self outputTarget new.
	project := target class newProject.
	
	(self hasFlag: #templatable) ifTrue: [ project beTemplatable ].
	(self hasFlag: #mainRoot) ifTrue: [ strategy := PRBuildRootMainStrategy new ].
	(self hasFlag: #all) ifTrue: [ strategy := PRBuildAllStrategy new ].
	
	self
		positional: #requestedFiles
		ifPresent: [ :files | strategy := PRBuildListStrategy list: (files collect: [ :f | f asFileReference ]) ].

	target buildStrategy: strategy.		
	(project build: target) exitProcess
]

{ #category : 'accessing' }
ClapPillarBuildCommand >> format [ 

	^ self positional: #format

]

{ #category : 'accessing' }
ClapPillarBuildCommand >> outputTarget [

	| format |
	format := self format.
	^ PRWritingTarget allSubclasses detect: [ :target | target builderName = format ]
]

{ #category : 'accessing' }
ClapPillarBuildCommand >> requestedFiles [ 

	^ self positional: #requestedFiles

]

{ #category : 'execution' }
ClapPillarBuildCommand >> strategy [

	^ strategy
]
