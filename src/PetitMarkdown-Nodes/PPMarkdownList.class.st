"
PPMarkdownList is the abstract superclass for list nodes; lists can only have list items as children.
"
Class {
	#name : #PPMarkdownList,
	#superclass : #PPMarkdownCompositeNode,
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #'as yet unclassified' }
PPMarkdownList >> initialize [
	super initialize.
	children add: PPMarkdownNullBlock new
]

{ #category : #testing }
PPMarkdownList >> isList [
	^ true
]

{ #category : #testing }
PPMarkdownList >> isOrdered [
	^ false
]

{ #category : #accessing }
PPMarkdownList >> items [
	^ children
]

{ #category : #accessing }
PPMarkdownList >> items: aCollection [
	children := aCollection
]

{ #category : #accessing }
PPMarkdownList >> size [
	^ children size
]
