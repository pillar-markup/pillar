"
Style as superscript
"
Class {
	#name : #PRSuperscriptFormat,
	#superclass : #PRFormat,
	#category : #'Pillar-Model-Document'
}

{ #category : #testing }
PRSuperscriptFormat class >> isAbstract [
	^ false
]

{ #category : #visiting }
PRSuperscriptFormat >> accept: aVisitor [
	^aVisitor visitSuperscriptFormat: self
]
