Class {
	#name : #PRColumnTest,
	#superclass : #PRDocumentGroupTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRColumnTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRColumnTest >> actualClass [
	^ PRColumn
]
