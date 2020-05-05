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
	^ (ClapCommand id: self commandName asSymbol)
		description: 'Check code in all the codeblocks in given file or book, then generate a report';
		add: ClapFlag forHelp;
		add: ((ClapPositional id: #fileToCheck )
			description: 'Pillar document you want to check';
			implicitMeaning: [ '' ]);
		meaning:
			[ :args |
			args at: #helpFlag ifPresent: [ :help | help value; exitSuccess ].
			(self with: args) execute ]
	
]

{ #category : #execution }
ClapPillarCheckCommand >> execute [
	| target |
	target := PRCheckBookTarget new.
	target buildStrategy: (PRBuildListStrategy list: (self fileToCheck) asArray).
	^ target buildOn: self project.
]

{ #category : #activation }
ClapPillarCheckCommand >> fileToCheck [
	^ (arguments at: #fileToCheck) value: self
]
