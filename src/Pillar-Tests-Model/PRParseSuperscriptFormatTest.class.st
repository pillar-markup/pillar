Class {
	#name : #PRParseSuperscriptFormatTest,
	#superclass : #PRParseFormatTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRParseSuperscriptFormatTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRParseSuperscriptFormatTest >> actualClass [
	^ PRSuperscriptFormat
]
