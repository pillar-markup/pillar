"
I am a command line handler to **create a pillar project in the current directory**.
The pillar project contains a basic template and skeleton pillar files following the archetype convention.

**Example of usage: **`./pillar archetype book`
"
Class {
	#name : 'ClapPillarArchetypeCommand',
	#superclass : 'ClapPillarCommand',
	#category : 'Pillar-Cli-Clap',
	#package : 'Pillar-Cli',
	#tag : 'Clap'
}

{ #category : 'accessing' }
ClapPillarArchetypeCommand class >> commandName [
	^'archetype'
]

{ #category : 'command line' }
ClapPillarArchetypeCommand class >> commandSpecification [ 
	<commandline>
	^ (ClapCommandSpec id: self commandName asSymbol)
		description: 'Create a pillar project in the current directory, which contains a basic template and skeleton pillar files following the archetype convention';
		addHelp;
		commandClass: self;
		addPositional: #requestedArchetype description: 'Archetype you want to use';
	yourself
]

{ #category : 'execution' }
ClapPillarArchetypeCommand >> execute [
	self project installArchetypeNamed: self requestedArchetype asString.
]

{ #category : 'activation' }
ClapPillarArchetypeCommand >> requestedArchetype [

	 ^ self positional: #requestedArchetype
]
