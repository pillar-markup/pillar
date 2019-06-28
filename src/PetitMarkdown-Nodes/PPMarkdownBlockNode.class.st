"
PPMarkdownBlockNode is the abstract superclass of block-level nodes in a markdown abstract syntax tree.
"
Class {
	#name : #PPMarkdownBlockNode,
	#superclass : #PPMarkdownNode,
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #testing }
PPMarkdownBlockNode >> isBlock [
	^ true
]

{ #category : #visiting }
PPMarkdownBlockNode >> visit: aVisitor [
	aVisitor acceptBlockNode: self.
]
