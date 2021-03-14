Class {
	#name : #PRLineBreakTest,
	#superclass : #PRDocumentItemTest,
	#category : #'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRLineBreakTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRLineBreakTest >> actualClass [
	^ PRLineBreak
]
