"
I am a item within a *PRList*.
"
Class {
	#name : #PRListItem,
	#superclass : #PRDocumentGroup,
	#category : 'Pillar-Model-Document'
}

{ #category : #testing }
PRListItem class >> isAbstract [
	^ false
]

{ #category : #visiting }
PRListItem >> accept: aVisitor [
	aVisitor visitListItem: self
]
