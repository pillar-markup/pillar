Class {
	#name : 'PRListItemTest',
	#superclass : 'PRDocumentGroupTest',
	#category : 'Pillar-Tests-Model-Document',
	#package : 'Pillar-Tests-Model',
	#tag : 'Document'
}

{ #category : 'testing' }
PRListItemTest class >> isAbstract [
	^ false
]

{ #category : 'private' }
PRListItemTest >> actualClass [
	^ PRListItem
]
