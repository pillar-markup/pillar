Class {
	#name : 'ClapPillarBookTesterCommand',
	#superclass : 'ClapPillarCommand',
	#category : 'Pillar-Cli-BookTester-Command',
	#package : 'Pillar-Cli-BookTester',
	#tag : 'Command'
}

{ #category : 'accessing' }
ClapPillarBookTesterCommand class >> commandName [
	^ 'check'
]

{ #category : 'accessing' }
ClapPillarBookTesterCommand class >> commandSpecification [
	<commandline>
	
	^ (ClapCommandSpec id: self commandName asSymbol)
		commandClass: self; 
		description: 'Run the book checker to spot broken tests, duplicated anchor and more.';
		addPositional: #requestedFile description: 'The main file';
		addHelp;
		yourself
]

{ #category : 'execution' }
ClapPillarBookTesterCommand >> execute [
	| file |
	file :=  self requestedFile asString asFileReference. 
	file exists 
		ifTrue: [ 
			| reporter parent |
			parent := self project baseDirectory.
			reporter := MicAnalysisReportWriter 
				reportForFolder: parent 
				startingFrom: file 
				configuration: self project configuration.
				
			reporter isOkay
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
										reporter buildReportOn: str ] ] ]
		ifFalse: [ 
				self outputStreamDo: [ :str | 
					str 
						cr; 
						nextPutAll: 'File ' ; 
						nextPutAll: file fullName ; 
						nextPutAll: ' does not exist.'  ] ]
]

{ #category : 'execution' }
ClapPillarBookTesterCommand >> relativePathStringOf: aFile [

	^ ((FileSystem workingDirectory resolve: aFile) relativeTo: FileSystem workingDirectory) fullName
]

{ #category : 'execution' }
ClapPillarBookTesterCommand >> requestedFile [

	^ self positional: #requestedFile
]
