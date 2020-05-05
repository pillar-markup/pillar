Class {
	#name : #ClapPillarServeCommand,
	#superclass : #ClapPillarCommand,
	#instVars : [
		'port',
		'baseurl'
	],
	#category : #'Pillar-Cli-Clap'
}

{ #category : #accessing }
ClapPillarServeCommand class >> commandName [
	^ 'serve'
]

{ #category : #'command line' }
ClapPillarServeCommand class >> commandSpecification [
	<commandline>
	^ (ClapCommand id: self commandName asSymbol)
		description: 'Serve of the current project';
		add: ClapFlag forHelp;
		add: ((ClapPositional id: #baseurl )
			description: 'Your base URL, empty by default';
			implicitMeaning: [ '' ]);
		add: ((ClapPositional id: #port)
			description: 'Your port, 8080 by default';
			meaning: [ :m | m word asInteger ];
			implicitMeaning: [ 8080 ]);		
		add: ((ClapFlag id: #watch )
			canonicalName: 'w');
		meaning:
			[ :args |
			args at: #helpFlag ifPresent: [ :help | help value; exitSuccess ].
			(self with: args) execute ]
	
]

{ #category : #activation }
ClapPillarServeCommand >> baseurl [
	^ baseurl ifNil: [ baseurl := (arguments at: #baseurl) value]
]

{ #category : #execution }
ClapPillarServeCommand >> execute [
	self port.
	self baseurl.
	
	arguments context stdout
		nextPutAll: 'Serving website at: http://localhost:';
		nextPutAll: port asString;
		nextPutAll: '/';
		nextPutAll: baseurl;
		lf.
	
	(ZnServer defaultOn: port) start.
	ZnServer default
		delegate:
			(ZnStaticFileServerDelegate new
				prefixFromString: baseurl;
				directory: self project baseDirectory / '_result/html/';
				yourself).
	
	^ self watch.
]

{ #category : #activation }
ClapPillarServeCommand >> port [
	^ port ifNil: [ port := (arguments at: #port) value]
]

{ #category : #activation }
ClapPillarServeCommand >> watch [
	(arguments at: #watch) isExplicit
		ifFalse: [ ^ self ]
		ifTrue: [ 
			| watcher |
			watcher := PRWatcher new.
			watcher project: self project.
			watcher start
			 ]
]
