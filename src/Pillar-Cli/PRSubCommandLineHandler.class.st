"
I am the abstract super class of all sub commands for Pillar (export, export-all etc).

I collaborate with a builder to which I pass the information: 
	- configuration file
	- base directory
	- input file
	
and kick its execution. 
Subclasses should set the configurationInstaller
"
Class {
	#name : #PRSubCommandLineHandler,
	#superclass : #CommandLineHandler,
	#instVars : [
		'baseDirectory',
		'configurationInstaller',
		'configuration'
	],
	#category : 'Pillar-Cli-Handlers'
}

{ #category : #accessing }
PRSubCommandLineHandler class >> argumentsOutOfConfiguration [
	"such keys should get ignored after being treated by the command line"
	^ #('configurationFile' 'to')
]

{ #category : #accessing }
PRSubCommandLineHandler class >> defaultConfigurationFileName [
	^ 'pillar.conf'
]

{ #category : #testing }
PRSubCommandLineHandler class >> isAbstract [

	^ self == PRSubCommandLineHandler
]

{ #category : #private }
PRSubCommandLineHandler >> add: argument to: arguments [
	"From the argument string '--key=value', add the key/value pair to the arguments dictionary."
	
	^ arguments add: (self parseKeyValueArgument: argument)
]

{ #category : #accessing }
PRSubCommandLineHandler >> command [

	| command |
	command := self newCommand.
	command configurationFileName: self configurationFileName.
	command workingDirectory: self workingDirectory.
	command extraArguments: self extraArguments.
	^ command
]

{ #category : #accessing }
PRSubCommandLineHandler >> configurationFileName [

	^ self
		optionAt: 'configurationFile'
		ifAbsent: [ self class defaultConfigurationFileName ]
]

{ #category : #'error handling' }
PRSubCommandLineHandler >> error: aString [
	self stderr << aString; lf.
	self exitFailure
]

{ #category : #'error handling' }
PRSubCommandLineHandler >> errorMissingParameter: aParameterName [
	self error: 'Missing required parameter --', aParameterName 
]

{ #category : #accessing }
PRSubCommandLineHandler >> extraArguments [

	"We parse the options --key=value into associations"
	| pairs argumentsDictionary |
	pairs := self arguments
		select: [ :commandLineArgPair | commandLineArgPair beginsWith: '--' ]
		thenCollect: [ :commandLineArgPair | 
			self parseKeyValueArgument: commandLineArgPair ].
	
	"We filter out some arguments"
	argumentsDictionary := (pairs reject: [ :p | self class argumentsOutOfConfiguration includes: p key ]) asDictionary.
	^ argumentsDictionary
]

{ #category : #private }
PRSubCommandLineHandler >> parseKeyValueArgument: argument [

	| key value argumentStream |
	argumentStream := argument readStream.
	(argumentStream next: '--' size) ~= '--'
		ifTrue: [ Error signal: 'Invalid parameter ', argument ].
	key := argumentStream upTo: $=.
	value := argumentStream upToEnd.
	^ key -> value
]

{ #category : #accessing }
PRSubCommandLineHandler >> project [

	^ PRProject on: self workingDirectory
]

{ #category : #accessing }
PRSubCommandLineHandler >> workingDirectory [

	^ self
		optionAt: 'baseDirectory'
		ifPresent: [ :dir | ^ dir asFileReference ]
		ifAbsent: [ self error: 'Should specify #baseDirectory option through command line' ]
]
