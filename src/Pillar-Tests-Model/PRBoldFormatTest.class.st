Class {
	#name : #PRBoldFormatTest,
	#superclass : #PRFormatTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRBoldFormatTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRBoldFormatTest >> actualClass [
	^ PRBoldFormat
]
