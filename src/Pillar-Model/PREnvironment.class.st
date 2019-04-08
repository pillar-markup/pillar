Class {
	#name : #PREnvironment,
	#superclass : #PRDocumentGroup,
	#category : #'Pillar-Model-Document'
}

{ #category : #testing }
PREnvironment class >> isAbstract [
	^ false
]

{ #category : #visiting }
PREnvironment >> accept: aVisitor [
	aVisitor visitColumns: self
]
