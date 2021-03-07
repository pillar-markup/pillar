Class {
	#name : #PRParseItalicFormatTest,
	#superclass : #PRParseFormatTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRParseItalicFormatTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseItalicFormatTest >> actualClass [
	^ PRItalicFormat
]
