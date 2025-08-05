"
I am a command line handler to **serve of the current project**.

**Example of usage: **`./pillar serve -w`
"
Class {
	#name : 'ClapPillarServeCommand',
	#superclass : 'ClapPillarCommand',
	#instVars : [
		'port',
		'baseurl'
	],
	#category : 'Pillar-Cli-Clap',
	#package : 'Pillar-Cli',
	#tag : 'Clap'
}

{ #category : 'accessing' }
ClapPillarServeCommand class >> commandName [
	^ 'serve'
]

{ #category : 'command line' }
ClapPillarServeCommand class >> commandSpecification [
	<commandline>
	^ (ClapCommandSpec id: self commandName asSymbol)
		description: 'Serve of the current project';
		commandClass: self;
		addHelp;
		addPositional: #baseurl spec: [ :positional | 
				positional 
					description: 'Your base URL, empty by default';
					defaultValue: '' ];
		addPositional: #port spec: [ :positional | 
				positional 
					description: 'Your port, 8080 by default';
					defaultValue: [ 8080 ] ];	
		addFlag: #watch;
		yourself 
]

{ #category : 'activation' }
ClapPillarServeCommand >> baseurl [
	^ baseurl ifNil: [ baseurl := self positional: #baseurl ]
]

{ #category : 'execution' }
ClapPillarServeCommand >> execute [
	self port.
	self baseurl.

	context stdout
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

{ #category : 'activation' }
ClapPillarServeCommand >> port [
	^ port ifNil: [ port := (self positional: #port) asInteger ]
]

{ #category : 'activation' }
ClapPillarServeCommand >> watch [

	"here we do not use self positional: because we do not want to get the value but the object."
	(context positional: #watch) isExplicit
		ifFalse: [ ^ self ]
		ifTrue: [ 
			| watcher |
			watcher := PRWatcher new.
			watcher project: self project.
			watcher start
			]
]
