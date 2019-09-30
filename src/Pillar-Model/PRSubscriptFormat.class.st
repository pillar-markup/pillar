"
Style as subscript
"
Class {
	#name : #PRSubscriptFormat,
	#superclass : #PRFormat,
	#category : #'Pillar-Model-Document'
}

{ #category : #testing }
PRSubscriptFormat class >> isAbstract [
	^ false
]

{ #category : #visiting }
PRSubscriptFormat >> accept: aVisitor [
	^ aVisitor visitSubscriptFormat: self
]
