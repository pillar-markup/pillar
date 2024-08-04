"
I am a command line handler to convert a pillar file (for now) in a microdown file in the current directory and all the files that are includes in it.

## Example of usage: 

`./pillar convertBook SUnit.pillar`
"
Class {
	#name : 'ClapMicrodownBookReferenceCheckerCommand',
	#superclass : 'ClapPillarCommand',
	#category : 'Pillar-ExporterMicrodown',
	#package : 'Pillar-ExporterMicrodown'
}

{ #category : 'accessing' }
ClapMicrodownBookReferenceCheckerCommand class >> commandName [
	^'referenceCheck'
]

{ #category : 'command line' }
ClapMicrodownBookReferenceCheckerCommand class >> commandSpecification [ 
	<commandline>
	^ (ClapCommand id: self commandName asSymbol)
		description: 'Check the duplicated or unknown references';
		add: ClapFlag forHelp;
		add: ((ClapPositional id: #requestedFile)
			description: 'File for the book you want to verify');
		meaning:
			[ :args |
			args at: #helpFlag ifPresent: [ :help | help value; exitSuccess ].
			(self with: args) execute ]
]

{ #category : 'execution' }
ClapMicrodownBookReferenceCheckerCommand >> execute [
	| file checker |
	file :=  self requestedFile asString asFileReference. 

	file exists 
		ifTrue: [ 
			checker := MicReferenceChecker new.
			checker fileSystem: FileSystem workingDirectory.
			checker checkProject: file.
			checker isOkay
					ifTrue: [ 
						self outputStreamDo: 
									[ :str | str 
											cr;
											nextPutAll:  'File ' ; 
											nextPutAll: (self relativePathStringOf: file) ; 
											nextPutAll: ' does not have reference problems.' ]]
					ifFalse: [ 
						self outputStreamDo: 
									[ :str | 
										str 
											cr; 
											nextPutAll: 'File ' ; 
											nextPutAll: (self relativePathStringOf: file) ; 
											nextPutAll: ' has reference problems.'; cr.
										checker buildReportOn: str ] ] ]
		ifFalse: [ 
				self outputStreamDo: [ :str | 
					str 
						cr; 
						nextPutAll: 'File ' ; 
						nextPutAll: file fullName ; 
						nextPutAll: ' does not exist.'  ] ]
]

{ #category : 'execution' }
ClapMicrodownBookReferenceCheckerCommand >> relativePathStringOf: aFile [

	^ ((FileSystem workingDirectory resolve: aFile) relativeTo: FileSystem workingDirectory) fullName
]

{ #category : 'execution' }
ClapMicrodownBookReferenceCheckerCommand >> requestedFile [
	 ^ (arguments at: #requestedFile) value: self
]
