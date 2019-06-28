"
PPMarkdownList is the abstract superclass for list nodes; lists can only have list items as children.
"
Class {
	#name : #PPMarkdownList,
	#superclass : #PPMarkdownCompositeNode,
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #testing }
PPMarkdownList >> isList [
	^ true
]

{ #category : #testing }
PPMarkdownList >> isOrdered [
	^ false
]

{ #category : #accessing }
PPMarkdownList >> size [
	^ items size
]
