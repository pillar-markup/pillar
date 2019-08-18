"
An empty paragraph
"
Class {
	#name : #PREmptyParagraph,
	#superclass : #PRParagraph,
	#category : #'Pillar-Model-Minimal'
}

{ #category : #visiting }
PREmptyParagraph >> accept: aVisitor [
	aVisitor visitEmptyParagraph: self
]
