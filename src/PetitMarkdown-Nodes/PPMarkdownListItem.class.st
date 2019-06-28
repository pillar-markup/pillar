"
A PPMarkdownListItem is an item in a list.

The type of label must match the list type (ordered or unordered).

Children nodes can be either a single paragraph if the list item is compact/tight, or any sequence of block-level nodes otherwise.
"
Class {
	#name : #PPMarkdownListItem,
	#superclass : #PPMarkdownCompositeNode,
	#instVars : [
		'label'
	],
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #adding }
PPMarkdownListItem >> addAll: aCollection [ 
	self shouldBeImplemented.
]

{ #category : #testing }
PPMarkdownListItem >> isItem [
	^ true
]

{ #category : #accessing }
PPMarkdownListItem >> label [
	^ label
]

{ #category : #accessing }
PPMarkdownListItem >> label: aLabel [ 
	label := aLabel
]

{ #category : #visiting }
PPMarkdownListItem >> visit: aVisitor [
	aVisitor acceptListItem: self.
]
