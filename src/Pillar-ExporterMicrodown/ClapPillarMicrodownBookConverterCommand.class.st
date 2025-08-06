"
I am a command line handler to convert a pillar file (for now) in a microdown file in the current directory and all the files that are includes in it.

## Example of usage: 

`./pillar convertBook SUnit.pillar`
"
Class {
	#name : 'ClapPillarMicrodownBookConverterCommand',
	#superclass : 'ClapPillarCommand',
	#category : 'Pillar-ExporterMicrodown',
	#package : 'Pillar-ExporterMicrodown'
}

{ #category : 'accessing' }
ClapPillarMicrodownBookConverterCommand class >> commandName [
	^'convertBook'
]

{ #category : 'command line' }
ClapPillarMicrodownBookConverterCommand class >> commandSpecification [ 
	<commandline>
	^ (ClapCommandSpec id: self commandName asSymbol)
		description: 'Create a microdown book in the current directory, which contains the conversion in microdown format of the argument.';
		commandClass: self;
		addHelp;
		addPositional: #requestedFile
			description: 'File for the book you want to convert';
		yourself
]

{ #category : 'execution' }
ClapPillarMicrodownBookConverterCommand >> execute [
	| file |
	file :=  self requestedFile asString asFileReference. 
	file exists 
		ifTrue: [ PRConverterToMic new convertBook: file ]
		ifFalse: [ self outputStreamDo: [ :str | str nextPutAll: 'File ', file fullName, ' does not exist'  ] ]
]

{ #category : 'execution' }
ClapPillarMicrodownBookConverterCommand >> requestedFile [
	 ^ self positional: #requestedFile
]
