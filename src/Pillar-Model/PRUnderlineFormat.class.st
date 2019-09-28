"
Style as underline formatted
"
Class {
	#name : #PRUnderlineFormat,
	#superclass : #PRFormat,
	#category : #'Pillar-Model-Document'
}

{ #category : #testing }
PRUnderlineFormat class >> isAbstract [
	^ false
]

{ #category : #visiting }
PRUnderlineFormat >> accept: aVisitor [
	^aVisitor visitUnderlineFormat: self
]
