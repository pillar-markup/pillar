"
I am a commandline to **update archetypes in build repository**.

Indeed, directory 'archetypes' used by CLAP isn't updated automatically by Git or Iceberg since it's located in another place.

So use me when a file in 'archetype' changed to update it.
"
Class {
	#name : #ClapPillarUpdateBuildCommand,
	#superclass : #ClapPillarCommand,
	#category : #'Pillar-Cli-Clap'
}

{ #category : #accessing }
ClapPillarUpdateBuildCommand class >> commandName [
	^ 'updateBuild'
]

{ #category : #'command line' }
ClapPillarUpdateBuildCommand class >> commandSpecification [
	<commandline>
	^ (ClapCommand id: self commandName asSymbol)
		description: 'Update build/archetypes using folder in parent directory';
		add: ClapFlag forHelp;
		meaning:
			[ :args |
			args at: #helpFlag ifPresent: [ :help | help value; exitSuccess ].
			(self with: args) execute ]
	
]

{ #category : #execution }
ClapPillarUpdateBuildCommand >> execute [
	self project updateBuild
]
