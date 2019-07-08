"
A PPMarkdownRule represents a horizontal rule.

"
Class {
	#name : #PPMarkdownRule,
	#superclass : #PPMarkdownBlockNode,
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #testing }
PPMarkdownRule >> isRule [
	^ true
]

{ #category : #visiting }
PPMarkdownRule >> visit: aVisitor [
	^ aVisitor acceptRule: self.
]
