"
PPMarkdownCompositeNode is the superclass for block-level nodes that contain other block-level nodes.
"
Class {
	#name : #PPMarkdownCompositeNode,
	#superclass : #PPMarkdownBlockNode,
	#instVars : [
		'children'
	],
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #initialization }
PPMarkdownCompositeNode >> initialize [
	super initialize.
	children := OrderedCollection with: PPMarkdownNullBlock new
]
