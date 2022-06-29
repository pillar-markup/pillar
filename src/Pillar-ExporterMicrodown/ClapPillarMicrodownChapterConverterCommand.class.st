"
I am a command line handler to convert a pillar file (for now) in a microdown file in the current directory.

## Example of usage: 

`./pillar convertChapter SUnit.pillar`
"
Class {
	#name : #ClapPillarMicrodownChapterConverterCommand,
	#superclass : #ClapPillarCommand,
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #accessing }
ClapPillarMicrodownChapterConverterCommand class >> commandName [
	^'convertChapter'
]

{ #category : #'command line' }
ClapPillarMicrodownChapterConverterCommand class >> commandSpecification [ 
	<commandline>
	^ (ClapCommand id: self commandName asSymbol)
		description: 'Create a microdown book chapter in the current directory, which contains the conversion in microdown format of the argument.';
		add: ClapFlag forHelp;
		add: ((ClapPositional id: #requestedFile)
			description: 'File for the book chapter you want to convert');
		meaning:
			[ :args |
			args at: #helpFlag ifPresent: [ :help | help value; exitSuccess ].
			(self with: args) execute ]
]

{ #category : #execution }
ClapPillarMicrodownChapterConverterCommand >> execute [
	| file |
	file :=  self requestedFile asString asFileReference. 
	file exists 
		ifTrue: [ PRConverterToMic new convertChapter: file ]
		ifFalse: [ self outputStreamDo: [ :str | str nextPutAll: 'File ', file fullName, ' does not exist'  ] ]
]

{ #category : #activation }
ClapPillarMicrodownChapterConverterCommand >> requestedFile [
	 ^ (arguments at: #requestedFile) value: self
]
