"
Looks like a little hack to be able to pass extra parameters during the documentFor: invocation?
"
Class {
	#name : #PRCheckBookTarget,
	#superclass : #PRTarget,
	#category : #'Pillar-BookTester-CommandLine'
}

{ #category : #accessing }
PRCheckBookTarget class >> builderName [
	
	^ #checkBook
]

{ #category : #building }
PRCheckBookTarget >> buildOn: aProject [
	| status |
	status := PRSuccess new.
	
	"We chech each file"
	(self filesToBuildOn: aProject) do: [ :each |
		status := status and: ((self documentFor: each) buildOn: aProject) ].

	^ status
]

{ #category : #building }
PRCheckBookTarget >> documentFor: aFile [
	^ PRCheckBookDocument new
		project: aFile project;
		file: aFile;
		target: self;
		outputDirectory: (aFile project baseDirectory / self outputDirectoryName ) ensureCreateDirectory;
		yourself
]

{ #category : #accessing }
PRCheckBookTarget >> extension [
	^ 'txt'
]

{ #category : #accessing }
PRCheckBookTarget >> outputDirectoryName [ 
	^ '_check'
]

{ #category : #preparation }
PRCheckBookTarget >> prepareForExecutionOn: aPRProject [ 
	
	"Do nothing"
]
