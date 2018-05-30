Class {
	#name : #PRItalicFormatTest,
	#superclass : #PRFormatTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRItalicFormatTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRItalicFormatTest >> actualClass [
	^ PRItalicFormat
]
