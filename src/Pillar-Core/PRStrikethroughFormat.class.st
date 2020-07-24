"
Strikethrough format
"
Class {
	#name : #PRStrikethroughFormat,
	#superclass : #PRFormat,
	#category : #'Pillar-Core-Model'
}

{ #category : #testing }
PRStrikethroughFormat class >> isAbstract [
	^ false
]

{ #category : #visiting }
PRStrikethroughFormat >> accept: aVisitor [
	^ aVisitor visitStrikethroughFormat: self
]
