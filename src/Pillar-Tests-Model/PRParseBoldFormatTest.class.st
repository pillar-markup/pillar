Class {
	#name : #PRParseBoldFormatTest,
	#superclass : #PRParseFormatTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRParseBoldFormatTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseBoldFormatTest >> actualClass [
	^ PRBoldFormat
]
