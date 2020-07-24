"
Style as subscript
"
Class {
	#name : #PRSubscriptFormat,
	#superclass : #PRFormat,
	#category : #'Pillar-Model-Document'
}

{ #category : #visiting }
PRSubscriptFormat >> accept: aVisitor [
	^ aVisitor visitSubscriptFormat: self
]
