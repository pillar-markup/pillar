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
			| reporter parent exampleChecker checker collector |
			parent := self project baseDirectory.

			reporter := MicAnalysisReportWriter new.
			checker := MicReferenceChecker new.
			checker fileSystem: parent.
			checker checkProject: file.

			reporter addResults: checker results.
			
			collector := MicFileCollector new.
			collector 
				rootDirectory: parent;
				visit: (Microdown parseFile: file).
			
			exampleChecker := MicCodeBlockValidator new.
			
			collector visitedFiles do: [ :each |
				exampleChecker start: each ].
			reporter addResults: exampleChecker results. 
				
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
