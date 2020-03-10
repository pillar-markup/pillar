Class {
	#name : #ClapPillarBuildCommand,
	#superclass : #ClapApplication,
	#instVars : [
		'project',
		'target'
	],
	#classInstVars : [
		'project'
	],
	#category : #'Pillar-Cli-Clap'
}

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
ClapPillarBuildCommand class >> commandSpecificationOld [
	
	^ (ClapCommand id: #build)
		description: 'Build your Pillar documents and export with a given format';
		add: ClapFlag forHelp;
		add:
			((ClapPositional id: #requestedBuilder)
				description: 'Format you want to export as');
		add:
			((ClapPositional id: #requestedFiles)
				description: 'Pillar files you want to build';
				multiple: true);
		add:
			((ClapFlag id: #all)
				description: 'Build all Pillar documents in repository';
				canonicalName: 'a');
		add:
			((ClapFlag id: #mainRoot)
				description: 'Build index.pillar in root directory';
				canonicalName: 'm');
		add:
			((ClapFlag id: #templatable)
				description: 'Use a template');
		meaning: [ :args | 
			args at: #helpFlag ifPresent: [ :help | help value; exitSuccess ].
			(self with: args) execute
			 ]
]

{ #category : #'as yet unclassified' }
ClapPillarBuildCommand >> allFlag: aBoolean [
	aBoolean
		ifTrue: [ target buildAll ]
]

{ #category : #'as yet unclassified' }
ClapPillarBuildCommand >> evaluateFlags [
	self templatableFlag: (arguments  at: #templatable) isExplicit.
	self allFlag: (arguments  at: #all) isExplicit.
	self mainRootFlag: (arguments at: #mainRoot ) isExplicit.
]

{ #category : #execution }
ClapPillarBuildCommand >> execute [
	self project.
	self target: (arguments at: #requestedBuilder) value.
	self requestedFiles: (arguments at: #requestedFiles) isExplicit.
	self evaluateFlags.
	self result.
]

{ #category : #'as yet unclassified' }
ClapPillarBuildCommand >> mainRootFlag: aBoolean [
	aBoolean
		ifTrue: [ target buildMainRoot ].
]

{ #category : #accessing }
ClapPillarBuildCommand >> project [
	^ project ifNil: [ project := PRProject on: (FileSystem workingDirectory) ]
]

{ #category : #'as yet unclassified' }
ClapPillarBuildCommand >> requestedFiles: aBoolean [
	aBoolean
		ifFalse: [ target buildMainRoot ]
		ifTrue: [ 
			| requestedFiles |
			requestedFiles := (arguments occurrencesOf: #requestedFiles) collect: #value.
			target buildOnly: requestedFiles ].
]

{ #category : #accessing }
ClapPillarBuildCommand >> result [
	(project build: target) exitProcess.
]

{ #category : #accessing }
ClapPillarBuildCommand >> target: requestedBuilder [
	target:= PRTarget builderForName: requestedBuilder 
]

{ #category : #'as yet unclassified' }
ClapPillarBuildCommand >> templatableFlag: aBoolean [
	aBoolean
		ifTrue: [ project beTemplatable ]
]
