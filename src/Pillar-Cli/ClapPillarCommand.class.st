Class {
	#name : #ClapPillarCommand,
	#superclass : #ClapApplication,
	#instVars : [
		'project'
	],
	#category : #'Pillar-Cli-Clap'
}

{ #category : #accessing }
ClapPillarCommand class >> commandName [
	self subclassResponsibility
]

{ #category : #'command line' }
ClapPillarCommand class >> commandSpecification [
	<commandline>
	
	| command |
	
	command := (ClapCommand id: #pillar)
		description: 'Pillar is a markup syntax and associated tools to write and generate documents lie books in PDF, websites in html, or slides';
		add: ClapFlag forHelp;
		add: ((ClapFlag id: #version )
			description: 'To print your Pillar version');	
		yourself.
	
	self pillarCommandsList do: [ :each | 
		command addSubcommand: each
		 ].
	 ^ command meaning: [ :args | 
		args at: #helpFlag ifPresent: [ :help | help value; exitSuccess ].
		args at: #version ifPresent: [ 
			| out |
			out := args context stdout.
			self printVersion: out ]
		]
]

{ #category : #accessing }
ClapPillarCommand class >> pillarCommandsList [
	^ self allSubclasses
		select: [ :each | each isAbstract not ]
		thenCollect: [ :each | each commandSpecification ]
]

{ #category : #printing }
ClapPillarCommand class >> printVersion: stream [
	stream newLine.
	stream newLine.
	stream nextPutAll: 'INFORMATION ABOUT VERSION'.
	stream newLine.
	stream newLine.
	stream nextPutAll: 'VM:    '; nextPutAll: Smalltalk vm version; cr.
	
	
	

		
	 
]

{ #category : #accessing }
ClapPillarCommand >> project [
	^ project ifNil: [ project := PRProject on: FileSystem workingDirectory  ]
]
