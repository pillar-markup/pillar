Class {
	#name : #PRParseUnderlineFormatTest,
	#superclass : #PRParseFormatTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRParseUnderlineFormatTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseUnderlineFormatTest >> actualClass [
	^ PRUnderlineFormat
]
