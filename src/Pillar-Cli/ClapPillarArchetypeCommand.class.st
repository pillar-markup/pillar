Class {
	#name : #ClapPillarArchetypeCommand,
	#superclass : #ClapApplication,
	#instVars : [
		'project'
	],
	#category : #'Pillar-Cli-Clap'
}

{ #category : #'command line' }
ClapPillarArchetypeCommand class >> commandSpecification [ 
	<commandline>
	^ (ClapCommand id: #archetype)
		description: 'Generate an archetype for you to create your perso Pillar project easier';
		add: ClapFlag forHelp;
		add: ((ClapPositional id: #requestedArchetype )
			description: 'Archetype you want to use');
		add: ((ClapFlag id: #templatable )
			description: 'Use a template');			
		meaning:
			[ :args |
			args at: #helpFlag ifPresent: [ :help | help value; exitSuccess ].
			(self with: args) execute ]
]

{ #category : #execution }
ClapPillarArchetypeCommand >> execute [
	self project installArchetypeNamed: self requestedArchetype asString.
]

{ #category : #accessing }
ClapPillarArchetypeCommand >> project [

	^ project ifNil: [ project := PRProject on: FileSystem workingDirectory  ]
]

{ #category : #activation }
ClapPillarArchetypeCommand >> requestedArchetype [
	 ^ (arguments at: #requestedArchetype) value: self
]
