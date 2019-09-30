"
A commented line
"
Class {
	#name : #PRCommentedLine,
	#superclass : #PRText,
	#category : #'Pillar-Model-Document'
}

{ #category : #visiting }
PRCommentedLine >> accept: aVisitor [
	^ aVisitor visitCommentedLine: self
]
