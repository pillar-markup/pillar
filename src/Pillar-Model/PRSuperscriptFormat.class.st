"
Style as superscript
"
Class {
	#name : #PRSuperscriptFormat,
	#superclass : #PRFormat,
	#category : #'Pillar-Model-Document'
}

{ #category : #visiting }
PRSuperscriptFormat >> accept: aVisitor [
	^ aVisitor visitSuperscriptFormat: self
]
