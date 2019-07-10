"
Monospace styling
"
Class {
	#name : #PRMonospaceFormat,
	#superclass : #PRFormat,
	#category : #'Pillar-Model-Minimal'
}

{ #category : #testing }
PRMonospaceFormat class >> isAbstract [
	^ false
]

{ #category : #visiting }
PRMonospaceFormat >> accept: aVisitor [
	aVisitor visitMonospaceFormat: self
]
