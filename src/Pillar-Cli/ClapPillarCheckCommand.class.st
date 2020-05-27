Class {
	#name : #ClapPillarCheckCommand,
	#superclass : #ClapPillarCommand,
	#category : #'Pillar-Cli-Clap'
}

{ #category : #accessing }
ClapPillarCheckCommand class >> commandName [
	^ 'check'
]

{ #category : #'command line' }
ClapPillarCheckCommand class >> commandSpecification [
	<commandline>
	| target |
	target := PRCheckBookTarget new.
	^ (ClapCommand id: self commandName asSymbol)
		description: 'Check code in all the codeblocks in given file or book, then generate a report';
		add: ClapFlag forHelp;
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
