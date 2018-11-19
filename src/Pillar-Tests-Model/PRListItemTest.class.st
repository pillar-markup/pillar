Class {
	#name : #PRListItemTest,
	#superclass : #PRDocumentGroupTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #testing }
PRListItemTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRListItemTest >> actualClass [
	^ PRListItem
]
