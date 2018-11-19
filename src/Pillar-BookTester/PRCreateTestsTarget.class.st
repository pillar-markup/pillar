"
Looks like a little hack to be able to pass extra parameters during the documentFor: invocation?
"
Class {
	#name : #PRCreateTestsTarget,
	#superclass : #PRTarget,
	#category : 'Pillar-BookTester-CommandLine'
}

{ #category : #accessing }
PRCreateTestsTarget class >> builderName [

	^#createTests
]

{ #category : #building }
PRCreateTestsTarget >> documentFor: aFile [

	^ PRCreateTestsDocument new
		project: aFile project;
		file: aFile;
		target: self;
		yourself
]

{ #category : #building }
PRCreateTestsTarget >> prepareForExecutionOn: aPRProject [ 
	
	"Do nothing"
]
