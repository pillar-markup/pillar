"
An empty paragraph
"
Class {
	#name : #PREmptyParagraph,
	#superclass : #PRParagraph,
	#category : 'Pillar-Model-Document'
}

{ #category : #visiting }
PREmptyParagraph >> accept: aVisitor [
	aVisitor visitEmptyParagraph: self
]
