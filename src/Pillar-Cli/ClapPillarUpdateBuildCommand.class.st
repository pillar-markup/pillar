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
