"
I am a command line handler to convert a pillar file (for now) in a microdown file in the current directory and all the files that are includes in it.

## Example of usage: 

`./pillar convertBook SUnit.pillar`
"
Class {
	#name : #ClapPillarMicrodownBookConverterCommand,
	#superclass : #ClapPillarCommand,
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #accessing }
ClapPillarMicrodownBookConverterCommand class >> commandName [
	^'convertBook'
]

{ #category : #'command line' }
ClapPillarMicrodownBookConverterCommand class >> commandSpecification [ 
	<commandline>
	^ (ClapCommand id: self commandName asSymbol)
		description: 'Create a microdown book in the current directory, which contains the conversion in microdown format of the argument.';
		add: ClapFlag forHelp;
		add: ((ClapPositional id: #requestedFile)
			description: 'File for the book you want to convert');
		meaning:
			[ :args |
			args at: #helpFlag ifPresent: [ :help | help value; exitSuccess ].
			(self with: args) execute ]
]

{ #category : #execution }
ClapPillarMicrodownBookConverterCommand >> execute [
	| file |
	file :=  self requestedFile asString asFileReference. 
	file exists 
		ifTrue: [ PRConverterToMic new convertBook: file ]
		ifFalse: [ self outputStreamDo: [ :str | str nextPutAll: 'File ', file fullName, ' does not exist'  ] ]
]

{ #category : #execution }
ClapPillarMicrodownBookConverterCommand >> requestedFile [
	 ^ (arguments at: #requestedFile) value: self
]
