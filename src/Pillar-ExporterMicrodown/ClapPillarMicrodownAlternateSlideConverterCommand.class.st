"
I am a command line handler to convert a pillar slide file in a microdown file in the current directory.

## Example of usage: 

`./pillar convertSlide SUnit.pillar`
"
Class {
	#name : 'ClapPillarMicrodownAlternateSlideConverterCommand',
	#superclass : 'ClapPillarCommand',
	#category : 'Pillar-ExporterMicrodown',
	#package : 'Pillar-ExporterMicrodown'
}

{ #category : 'accessing' }
ClapPillarMicrodownAlternateSlideConverterCommand class >> commandName [
	^'convertAlternateSlide'
]

{ #category : 'command line' }
ClapPillarMicrodownAlternateSlideConverterCommand class >> commandSpecification [ 
	<commandline>
	^ (ClapCommandSpec id: self commandName asSymbol)
		description: 'Create a microdown slide file in the current directory, which contains the conversion in microdown format of the argument.';
		commandClass: self;
		addHelp;
		addPositional: #requestedFile
			description: 'File for the slide you want to convert';
		yourself
]

{ #category : 'execution' }
ClapPillarMicrodownAlternateSlideConverterCommand >> execute [
	| file |
	file :=  self requestedFile asString asFileReference. 
	file exists 
		ifTrue: [ PRAlternateConverterToMic new convertSlide: file ]
		ifFalse: [ self outputStreamDo: [ :str | str nextPutAll: 'File ', file fullName, ' does not exist'  ] ]
]

{ #category : 'activation' }
ClapPillarMicrodownAlternateSlideConverterCommand >> requestedFile [
	 ^ self positional: #requestedFile
]
