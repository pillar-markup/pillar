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
	"When CLAP issue about ambiguous action with subcommand/positionnal will be solved, replace the next lign by the following one: 
		defaultCommand := self new project defaultTarget buildClapCommandWithId: #build"
	defaultCommand := self new project defaultTarget buildClapCommandWithId: #build withPositionals: false.
	PRTarget clapCommandList do: [ :c | defaultCommand addSubcommand: c ].
	^ defaultCommand 
]
