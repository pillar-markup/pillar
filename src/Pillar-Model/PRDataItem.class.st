"
Data in a list
"
Class {
	#name : #PRDataItem,
	#superclass : #PRListItem,
	#category : #'Pillar-Model-Document'
}

{ #category : #visiting }
PRDataItem >> accept: aVisitor [
	^ aVisitor visitDataItem: self
]
