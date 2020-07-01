"
Strikethrough format
"
Class {
	#name : #PRStrikethroughFormat,
	#superclass : #PRFormat,
	#category : #'Pillar-Model-Document'
}

{ #category : #visiting }
PRStrikethroughFormat >> accept: aVisitor [
	^ aVisitor visitStrikethroughFormat: self
]
