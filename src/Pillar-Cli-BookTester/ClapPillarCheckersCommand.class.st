Class {
	#name : 'ClapPillarCheckersCommand',
	#superclass : 'ClapPillarCommand',
	#category : 'Pillar-Cli-BookTester-Command',
	#package : 'Pillar-Cli-BookTester',
	#tag : 'Command'
}

{ #category : 'accessing' }
ClapPillarCheckersCommand class >> commandName [
	^ 'checkers'
]

{ #category : 'accessing' }
ClapPillarCheckersCommand class >> commandSpecification [
	<commandline>
	
	^ (ClapCommandSpec id: self commandName asSymbol)
		commandClass: self; 
		description: 'Give the list of all the checkers';
		"addPositional: #requestedFile description: 'The main file';"
		addHelp;
		yourself
]

{ #category : 'execution' }
ClapPillarCheckersCommand >> execute [
	
		self outputStreamDo: 
			[ :str | str 
							cr;
							nextPutAll:  'The following checkers are available: '; cr .
							MicChecker allSubclasses do: [ :each | 
								str nextPutAll: '- '; nextPutAll: each checkerName; cr ]]
]

{ #category : 'execution' }
ClapPillarCheckersCommand >> relativePathStringOf: aFile [

	^ ((FileSystem workingDirectory resolve: aFile) relativeTo: FileSystem workingDirectory) fullName
]

{ #category : 'execution' }
ClapPillarCheckersCommand >> requestedFile [

	^ self positional: #requestedFile
]
