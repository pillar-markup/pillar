"
A PPMarkdownOrderedList represents an enumeration, where items are numbered.
"
Class {
	#name : #PPMarkdownOrderedList,
	#superclass : #PPMarkdownList,
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #testing }
PPMarkdownOrderedList >> isOrdered [
	^ true
]

{ #category : #visiting }
PPMarkdownOrderedList >> visit: aVisitor [
	aVisitor acceptOrderedList: self.
]
