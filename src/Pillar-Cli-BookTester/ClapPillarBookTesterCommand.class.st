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
	"Check the requested file and the files it includes, and print the problems found; raise a PRCommandError when the file does not exist."

	| file reporter |
	file := self requestedFile asString asFileReference.
	file exists ifFalse: [
			PRCommandError signal: ('The file {1} does not exist.' format:
					 { (self project displayNameOf: file) }) ].
	reporter := MicAnalysisReportWriter
		            reportForFolder: self project baseDirectory
		            startingFrom: file
		            configuration: self project configuration.
	reporter isOkay
		ifTrue: [
				self outputStreamDo: [ :str |
						str
							cr;
							nextPutAll: 'File ';
							nextPutAll: (self relativePathStringOf: file);
							nextPutAll: ' does not have reference problems.' ] ]
		ifFalse: [
				self outputStreamDo: [ :str |
						str
							cr;
							nextPutAll: 'File ';
							nextPutAll: (self relativePathStringOf: file);
							nextPutAll: ' has reference problems.';
							cr.
						reporter buildReportOn: str ] ]
]

{ #category : 'execution' }
ClapPillarBookTesterCommand >> relativePathStringOf: aFile [

	^ ((FileSystem workingDirectory resolve: aFile) relativeTo: FileSystem workingDirectory) fullName
]

{ #category : 'execution' }
ClapPillarBookTesterCommand >> requestedFile [

	^ self positional: #requestedFile
]
