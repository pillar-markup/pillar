"
Looks like a little hack to be able to pass extra parameters during the documentFor: invocation?
"
Class {
	#name : #PRCheckBookTarget,
	#superclass : #PRTarget,
	#category : 'Pillar-BookTester-CommandLine'
}

{ #category : #accessing }
PRCheckBookTarget class >> builderName [
	
	^ #checkBook
]

{ #category : #building }
PRCheckBookTarget >> documentFor: aFile [

	^ PRCheckBookDocument new
		project: aFile project;
		file: aFile;
		target: self;
		yourself
]

{ #category : #preparation }
PRCheckBookTarget >> prepareForExecutionOn: aPRProject [ 
	
	"Do nothing"
]
