"
I am a commandline to **check the code in all the codeblocks of a file, then I generate a report**.
"
Class {
	#name : 'ClapPillarCheckCommand',
	#superclass : 'ClapPillarCommand',
	#category : 'Pillar-Cli-Clap',
	#package : 'Pillar-Cli',
	#tag : 'Clap'
}

{ #category : 'accessing' }
ClapPillarCheckCommand class >> commandName [
	^ 'codeCheck'
]

{ #category : 'command line' }
ClapPillarCheckCommand class >> commandSpecification [
	<commandline>
	| target |
	target := PRCheckBookTarget new.
	^ (ClapCommandSpec id: self commandName asSymbol)
		description: 'Check code in all the codeblocks in given file or book, then generate a report';
		commandClass: self;
		addHelp;
		add: ((ClapPositional id: #requestedFiles )
			description: 'Pillar document(s) you want to check';
			implicitMeaning: [ '' ]);
		meaning:
			[ :args |
			args at: #helpFlag ifPresent: [ :help | help value; exitSuccess ].
			(args at: #requestedFiles ) isExplicit 
				ifTrue:[ 
					target buildStrategy: (PRBuildListStrategy list: (args occurrencesOf: #requestedFiles collect: #value) )
					]
				ifFalse: [ 
					target buildStrategy: (PRBuildAllStrategy new)
					 ].
			target buildOn: self new project.
			]
	
]
