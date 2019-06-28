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

{ #category : #adding }
PPMarkdownCompositeNode >> addAll: aCollection [
	children addAll: aCollection
]

{ #category : #accessing }
PPMarkdownCompositeNode >> children [
	^ children
]

{ #category : #initialization }
PPMarkdownCompositeNode >> initialize [
	super initialize.
	children := OrderedCollection with: PPMarkdownNullBlock new
]
