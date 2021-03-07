Class {
	#name : #PRParseSubscriptFormatTest,
	#superclass : #PRParseFormatTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRParseSubscriptFormatTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseSubscriptFormatTest >> actualClass [
	^ PRSubscriptFormat
]
