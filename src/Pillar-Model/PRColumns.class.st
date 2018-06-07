"
I am a columns environment.
"
Class {
	#name : #PRColumns,
	#superclass : #PRDocumentGroup,
	#category : 'Pillar-Model-Document'
}

{ #category : #testing }
PRColumns class >> isAbstract [
	^ false
]

{ #category : #visiting }
PRColumns >> accept: aVisitor [
	aVisitor visitColumns: self
]
