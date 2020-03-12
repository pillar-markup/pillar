Class {
	#name : #ClapPillarBuildCommand,
	#superclass : #ClapApplication,
	#category : #'Pillar-Cli-Clap'
}

{ #category : #'command line' }
ClapPillarBuildCommand class >> commandSpecification [
<commandline>
	| command |
	
	command := (ClapCommand id: #build)
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
