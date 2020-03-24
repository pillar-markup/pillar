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
	
	| defaultCommand  |
		
	defaultCommand := self new project defaultTarget buildClapCommandWithId: #build withPositionals: false.
	PRTarget clapCommandList do: [ :c | defaultCommand addSubcommand: c ].
	
	^ defaultCommand 

	
	
	
]
