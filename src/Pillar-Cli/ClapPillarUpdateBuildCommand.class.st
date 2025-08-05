"
I am a commandline to **update archetypes in build repository**.

Indeed, directory 'archetypes' used by CLAP isn't updated automatically by Git or Iceberg since it's located in another place.

So use me when a file in 'archetype' changed to update it.
"
Class {
	#name : 'ClapPillarUpdateBuildCommand',
	#superclass : 'ClapPillarCommand',
	#category : 'Pillar-Cli-Clap',
	#package : 'Pillar-Cli',
	#tag : 'Clap'
}

{ #category : 'accessing' }
ClapPillarUpdateBuildCommand class >> commandName [
	^ 'updateBuild'
]

{ #category : 'command line' }
ClapPillarUpdateBuildCommand class >> commandSpecification [
	<commandline>
	^ (ClapCommandSpec id: self commandName asSymbol)
		commandClass: self; 
		description: 'Update build/archetypes using folder in parent directory. This is only useful in development of archetypes because else Pillar is installed in one place and the user gets a copy of the template in a totally different place.';
		addHelp;
		yourself
]

{ #category : 'execution' }
ClapPillarUpdateBuildCommand >> execute [
	self project updateBuild
]
