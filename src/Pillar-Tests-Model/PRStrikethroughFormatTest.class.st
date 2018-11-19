Class {
	#name : #PRStrikethroughFormatTest,
	#superclass : #PRFormatTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRStrikethroughFormatTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRStrikethroughFormatTest >> actualClass [
	^ PRStrikethroughFormat
]
