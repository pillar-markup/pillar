"
Bold styling format
"
Class {
	#name : #PRBoldFormat,
	#superclass : #PRFormat,
	#category : #'Pillar-Core-Model'
}

{ #category : #testing }
PRBoldFormat class >> isAbstract [
	^ false
]

{ #category : #visiting }
PRBoldFormat >> accept: aVisitor [
	aVisitor visitBoldFormat: self
]
