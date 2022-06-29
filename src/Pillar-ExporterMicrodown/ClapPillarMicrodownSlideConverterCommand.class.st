"
I am a command line handler to convert a pillar slide file in a microdown file in the current directory.

## Example of usage: 

`./pillar convertSlide SUnit.pillar`
"
Class {
	#name : #ClapPillarMicrodownSlideConverterCommand,
	#superclass : #ClapPillarCommand,
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #accessing }
ClapPillarMicrodownSlideConverterCommand class >> commandName [
	^'convertSlide'
]

{ #category : #'command line' }
ClapPillarMicrodownSlideConverterCommand class >> commandSpecification [ 
	<commandline>
	^ (ClapCommand id: self commandName asSymbol)
		description: 'Create a microdown slide file in the current directory, which contains the conversion in microdown format of the argument.';
		add: ClapFlag forHelp;
		add: ((ClapPositional id: #requestedFile)
			description: 'File for the slide you want to convert');
		meaning:
			[ :args |
			args at: #helpFlag ifPresent: [ :help | help value; exitSuccess ].
			(self with: args) execute ]
]

{ #category : #execution }
ClapPillarMicrodownSlideConverterCommand >> execute [
	| file |
	file :=  self requestedFile asString asFileReference. 
	file exists 
		ifTrue: [ PRConverterToMic new convertSlide: file ]
		ifFalse: [ self outputStreamDo: [ :str | str nextPutAll: 'File ', file fullName, ' does not exist'  ] ]
]

{ #category : #activation }
ClapPillarMicrodownSlideConverterCommand >> requestedFile [
	 ^ (arguments at: #requestedFile) value: self
]
