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
	
	^ self defaultCommand.
	
	
	
]

{ #category : #'as yet unclassified' }
ClapPillarBuildCommand class >> defaultCommand [
	| defaultCommand  |
	defaultCommand := self new project defaultTarget buildClapCommandWithId: #build.
	PRTarget clapCommandList do: [ :c | defaultCommand addSubcommand: c ].
	^ defaultCommand 
]
