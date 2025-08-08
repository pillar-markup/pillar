"
I am a warning raised when a reference is not found during the resolution phase
"
Class {
	#name : 'PRReferenceNotFound',
	#superclass : 'PRWarning',
	#instVars : [
		'inputFile'
	],
	#category : 'Pillar-Core-Errors',
	#package : 'Pillar-Core',
	#tag : 'Errors'
}

{ #category : 'accessing' }
PRReferenceNotFound >> inputFile: aFile [
	inputFile := aFile
]

{ #category : 'accessing' }
PRReferenceNotFound >> messageText [
	^inputFile ifNil: [ super messageText ] ifNotNil: [ inputFile pathString, ' ', super messageText ]
]
