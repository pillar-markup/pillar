Class {
	#name : #PRColumnsTest,
	#superclass : #PRDocumentGroupTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRColumnsTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRColumnsTest >> actualClass [
	^ PRColumnEnvironment
]
