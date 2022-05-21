"
I am a command line handler to convert a pillar file (for now) in a microdown file in the current directory.

## Example of usage: 

`./pillar convert SUnit.pillar`
"
Class {
	#name : #ClapPillarMicrodownConverterCommand,
	#superclass : #ClapPillarCommand,
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #accessing }
ClapPillarMicrodownConverterCommand class >> commandName [
	^'convert'
]

{ #category : #'command line' }
ClapPillarMicrodownConverterCommand class >> commandSpecification [ 
	<commandline>
	^ (ClapCommand id: self commandName asSymbol)
		description: 'Create a microdown file in the current directory, which contains the conversion in microdown of the argument.';
		add: ClapFlag forHelp;
		add: ((ClapPositional id: #requestedFile)
			description: 'File you want to convert');
		meaning:
			[ :args |
			args at: #helpFlag ifPresent: [ :help | help value; exitSuccess ].
			(self with: args) execute ]
]

{ #category : #execution }
ClapPillarMicrodownConverterCommand >> execute [
	| file |
	file :=  self requestedFile asString asFileReference. 
	file exists ifTrue: [ 
		PRConverterToMic new goForBook: file ]
]

{ #category : #activation }
ClapPillarMicrodownConverterCommand >> requestedFile [
	 ^ (arguments at: #file) value: self
]
