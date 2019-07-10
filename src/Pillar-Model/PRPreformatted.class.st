"
I am preformatted text or source code. My children are instances of *PRText*.
"
Class {
	#name : #PRPreformatted,
	#superclass : #PRDocumentGroup,
	#category : #'Pillar-Model-Minimal'
}

{ #category : #testing }
PRPreformatted class >> isAbstract [
	^ false
]

{ #category : #visiting }
PRPreformatted >> accept: aVisitor [
	aVisitor visitPreformatted: self
]
