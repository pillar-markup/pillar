Class {
	#name : #ClapPillarBuildCommand,
	#superclass : #Object,
	#classInstVars : [
		'project'
	],
	#category : #'Pillar-Cli-Clap'
}

{ #category : #'as yet unclassified' }
ClapPillarBuildCommand class >> commandSpecification [
	<commandline>
	^ (ClapCommand id: #build)
		description: 'Build your Pillar documents and export with a given format';
		add:
			((ClapPositional id: #requestedBuilder)
				description: 'Format you want to export as';
				meaning: [ :m | m word asString ]);
		add:
			((ClapPositional id: #requestedFiles)
				description: 'Pillar files you want to build';
				multiple: true;
				meaning: [ :m | m word asString ]);
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
				description: 'Use a template';
				canonicalName: 'templatable');
		meaning: [ :args | 
			| target result |
			project := PRProject on: (FileSystem workingDirectory ).
			target := PRTarget builderForName: (args at: #requestedBuilder) value.
			(args at: #requestedFiles) isExplicit
				ifFalse: [ target buildMainRoot ]
				ifTrue: [ 
					| requestedFiles |
					requestedFiles := (args occurrencesOf: #requestedFiles) collect: #value.
					target buildOnly: requestedFiles ].
			(args at: #templatable) isExplicit 
				ifTrue: [ (self project) beTemplatable ].
			(args at: #all) isExplicit 
				ifTrue: [ target buildAll ].
			(args at: #mainRoot ) isExplicit
				ifTrue: [ target buildMainRoot ].
			result := (self project) build: target.
			result exitProcess
			 ]
]

{ #category : #accessing }
ClapPillarBuildCommand class >> project [
	 ^ project ifNil: [ project := PRProject on: (FileSystem workingDirectory )]
]
