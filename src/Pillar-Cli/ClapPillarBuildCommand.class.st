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
	
	| command |
	
	command := (ClapCommand id: self commandName asSymbol)
		description: 'Build your Pillar documents and export with a given format';
		add: ClapFlag forHelp;
		yourself.
	
	PRTarget clapCommandList do: [ :each | 
		command addSubcommand: each
		 ].
	 ^ command meaning: [ :args | 
		args at: #helpFlag ifPresent: [ :help | help value; exitSuccess ].
	]
]
