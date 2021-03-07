Class {
	#name : #PRParseMonospaceFormatTest,
	#superclass : #PRParseFormatTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRParseMonospaceFormatTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseMonospaceFormatTest >> actualClass [
	^ PRMonospaceFormat
]
