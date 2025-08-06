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
	^ (ClapCommandSpec id: self commandName asSymbol)
		description: 'Check the duplicated or unknown references as well as missing input files';
		addHelp; 
		commandClass: self;
		addPositional: #requestedFiles spec: [ :positional |
    		 positional      		
		     	description: 'File for the book you want to verify, default is index.md';
			   defaultValue: [ #('index.md') ] ];
		yourself
]

{ #category : 'execution' }
ClapMicrodownBookReferenceCheckerCommand >> execute [
	| file |
	file :=  self requestedFile asString asFileReference. 
	file exists 
		ifTrue: [ 
			| reporter  parent exampleChecker checker collector |
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
ClapMicrodownBookReferenceCheckerCommand >> relativePathStringOf: aFile [

	^ ((FileSystem workingDirectory resolve: aFile) relativeTo: FileSystem workingDirectory) fullName
]

{ #category : 'execution' }
ClapMicrodownBookReferenceCheckerCommand >> requestedFile [
	 ^ self positional: #requestedFile
]
