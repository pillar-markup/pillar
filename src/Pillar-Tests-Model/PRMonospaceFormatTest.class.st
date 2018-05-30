Class {
	#name : #PRMonospaceFormatTest,
	#superclass : #PRFormatTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRMonospaceFormatTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRMonospaceFormatTest >> actualClass [
	^ PRMonospaceFormat
]
