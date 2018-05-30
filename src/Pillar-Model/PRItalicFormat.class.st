"
Italic styling format
"
Class {
	#name : #PRItalicFormat,
	#superclass : #PRFormat,
	#category : 'Pillar-Model-Document'
}

{ #category : #testing }
PRItalicFormat class >> isAbstract [
	^ false
]

{ #category : #visiting }
PRItalicFormat >> accept: aVisitor [
	aVisitor visitItalicFormat: self
]
