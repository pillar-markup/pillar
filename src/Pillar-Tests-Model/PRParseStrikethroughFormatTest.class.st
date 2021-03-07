Class {
	#name : #PRParseStrikethroughFormatTest,
	#superclass : #PRParseFormatTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRParseStrikethroughFormatTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseStrikethroughFormatTest >> actualClass [
	^ PRStrikethroughFormat
]
