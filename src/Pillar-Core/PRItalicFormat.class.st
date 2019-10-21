"
Italic styling format
"
Class {
	#name : #PRItalicFormat,
	#superclass : #PRFormat,
	#category : #'Pillar-Core-Model'
}

{ #category : #testing }
PRItalicFormat class >> isAbstract [
	^ false
]

{ #category : #visiting }
PRItalicFormat >> accept: aVisitor [
	^ aVisitor visitItalicFormat: self
]
