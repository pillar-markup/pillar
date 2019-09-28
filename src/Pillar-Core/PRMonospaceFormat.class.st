"
Monospace styling
"
Class {
	#name : #PRMonospaceFormat,
	#superclass : #PRFormat,
	#category : #'Pillar-Core-Model'
}

{ #category : #testing }
PRMonospaceFormat class >> isAbstract [
	^ false
]

{ #category : #visiting }
PRMonospaceFormat >> accept: aVisitor [
	^ aVisitor visitMonospaceFormat: self
]
