"
Looks like a little hack to be able to pass extra parameters during the documentFor: invocation?
"
Class {
	#name : #PRCreateTestsTarget,
	#superclass : #PRTarget,
	#category : #'Pillar-BookTester-CommandLine'
}

{ #category : #accessing }
PRCreateTestsTarget class >> builderName [

	^#createTests
]

{ #category : #building }
PRCreateTestsTarget >> buildOn: aProject [
	| status |
	status := PRSuccess new.
	
	"We chech each file"
	(self filesToBuildOn: aProject) do: [ :each |
		status := status and: ((self documentFor: each) buildOn: aProject) ].

	^ status
]

{ #category : #building }
PRCreateTestsTarget >> documentFor: aFile [
	^ PRCreateTestsDocument new
		project: aFile project;
		file: aFile;
		target: self;
		outputDirectory: (aFile project baseDirectory / self outputDirectoryName ) ensureCreateDirectory;
		yourself
]

{ #category : #accessing }
PRCreateTestsTarget >> extension [
	^ 'txt'
]

{ #category : #accessing }
PRCreateTestsTarget >> outputDirectoryName [ 
	^ '_tests-generation'
]

{ #category : #accessing }
PRCreateTestsTarget >> prepareForExecutionOn: aPRProject [ 
	
	"Do nothing"
]
