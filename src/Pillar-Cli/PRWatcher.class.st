"
A class to watch served sites.
Each 5 seconds, the website is regenerated
"
Class {
	#name : #PRWatcher,
	#superclass : #Object,
	#instVars : [
		'process',
		'project'
	],
	#category : 'Pillar-Cli-Handlers'
}

{ #category : #'as yet unclassified' }
PRWatcher class >> stopAll [

	self allInstancesDo: #stop
]

{ #category : #'as yet unclassified' }
PRWatcher >> generateHtml [

	[ project build: PRHtmlOutput new ]
		on: Error do: [ : error | self logError: error ]
]

{ #category : #private }
PRWatcher >> logError: anError [

	Smalltalk logStdErrorDuring: [ :stderr|
		"install the line end conversion and force initialize the converter"
		stderr
			nextPutAll: anError messageText; cr;
			"reset the color"
			nextPut: Character escape; nextPutAll: '[0m'.
		anError signalerContext shortDebugStackOn: stderr.].
]

{ #category : #accessing }
PRWatcher >> project: anObject [
	project := anObject
]

{ #category : #accessing }
PRWatcher >> start [

	Stdio stdout nextPutAll: 'Watching: true';lf.
	process := [ [true] whileTrue: [ 
		3 seconds wait.
		self generateHtml. ]] fork
]

{ #category : #accessing }
PRWatcher >> stop [

	process terminate
]
