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
		yourself.
	
	self pillarCommandsList do: [ :each | 
		command addSubcommand: each
		 ].
	 ^ command meaning: [ :args | 
		args at: #helpFlag ifPresent: [ :help | help value; exitSuccess ].
	]
]

{ #category : #'as yet unclassified' }
ClapPillarCommand class >> pillarCommandsList [
	^ self allSubclasses
		select: [ :each | each isAbstract not ]
		thenCollect: [ :each | each commandSpecification ]
]

{ #category : #accessing }
ClapPillarCommand >> project [
	^ project ifNil: [ project := PRProject on: FileSystem workingDirectory  ]
]
