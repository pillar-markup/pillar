Class {
	#name : #ClapPillarBuildCommand,
	#superclass : #ClapPillarCommand,
	#category : #'Pillar-Cli-Clap'
}

{ #category : #accessing }
ClapPillarBuildCommand class >> commandName [
	^'build'
]

{ #category : #'command line' }
ClapPillarBuildCommand class >> commandSpecification [
	<commandline>
	
	| defaultCommand |
	defaultCommand := self defaultCommand.
	
	
	
]

{ #category : #'as yet unclassified' }
ClapPillarBuildCommand class >> defaultCommand [
	| defaultCommand  |
	defaultCommand := PRTarget default buildClapCommandWithId: #build.
	PRTarget clapCommandList do: [ :c | defaultCommand addSubcommand: c ].
	^ defaultCommand 
]
