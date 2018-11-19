"
./pillar version 
>>  1.0
"
Class {
	#name : #PRPillarVersionCommandLineHandler,
	#superclass : #PRSubCommandLineHandler,
	#category : 'Pillar-Cli-PillarVersion'
}

{ #category : #accessing }
PRPillarVersionCommandLineHandler class >> commandName [
	" Overwrite this method to provide a short name for this command handler.
	You may pass the commandName as first argument to the image to select this handler"
	^ 'version'
]

{ #category : #activation }
PRPillarVersionCommandLineHandler >> activate [
	self stdout
		nextPutAll: PRPillarVersion current asString;
		nextPutAll: OSPlatform current lineEnding.
	Smalltalk isInteractive 
		ifFalse: [ self exitSuccess ]
]
