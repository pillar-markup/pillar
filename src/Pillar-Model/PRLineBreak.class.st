"
I am a line break. I only show up in the wiki format.
"
Class {
	#name : #PRLineBreak,
	#superclass : #PRDocumentItem,
	#category : 'Pillar-Model-Document'
}

{ #category : #testing }
PRLineBreak class >> isAbstract [
	^ false
]

{ #category : #visiting }
PRLineBreak >> accept: aVisitor [
	aVisitor visitLineBreak: self
]
