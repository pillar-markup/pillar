"
I am a commandline to **generate tests from examples in the codeblocks of some file(s)**.
"
Class {
	#name : #ClapPillarGenerateTestsCommand,
	#superclass : #ClapPillarCommand,
	#category : #'Pillar-Cli-Clap'
}

{ #category : #accessing }
ClapPillarGenerateTestsCommand class >> commandName [
	^ 'generateTests'
]

{ #category : #'command line' }
ClapPillarGenerateTestsCommand class >> commandSpecification [
	<commandline>
	| target |
	target := PRCreateTestsTarget new.
	^ (ClapCommand id: self commandName asSymbol)
		description: 'Generate tests from examples in the codeblocks of Pillar file(s)';
		add: ClapFlag forHelp;
		add: ((ClapPositional id: #requestedFiles )
			description: 'Pillar document(s) used to generate tests';
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
