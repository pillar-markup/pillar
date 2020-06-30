"
I am a command line handler to **create a pillar project in the current directory**.
The pillar project contains a basic template and skeleton pillar files following the archetype convention.

**Example of usage: **`./pillar archetype book`
"
Class {
	#name : #ClapPillarArchetypeCommand,
	#superclass : #ClapPillarCommand,
	#category : #'Pillar-Cli-Clap'
}

{ #category : #accessing }
ClapPillarArchetypeCommand class >> commandName [
	^'archetype'
]

{ #category : #'command line' }
ClapPillarArchetypeCommand class >> commandSpecification [ 
	<commandline>
	^ (ClapCommand id: self commandName asSymbol)
		description: 'Create a pillar project in the current directory, which contains a basic template and skeleton pillar files following the archetype convention';
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

{ #category : #activation }
ClapPillarArchetypeCommand >> requestedArchetype [
	 ^ (arguments at: #requestedArchetype) value: self
]
