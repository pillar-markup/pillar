"
PPMarkdownNode is the abstract superclass of nodes in a markdown abstract syntax tree.

"
Class {
	#name : #PPMarkdownNode,
	#superclass : #Object,
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #testing }
PPMarkdownNode >> isBlock [
	^ false
]

{ #category : #testing }
PPMarkdownNode >> isCode [
	^ false
]

{ #category : #testing }
PPMarkdownNode >> isEmphasis [
	^ false
]

{ #category : #testing }
PPMarkdownNode >> isLinebreak [
	^ false
]

{ #category : #testing }
PPMarkdownNode >> isLink [
	^ false
]

{ #category : #testing }
PPMarkdownNode >> isList [
	^ false
]

{ #category : #testing }
PPMarkdownNode >> isRule [
	^ false
]

{ #category : #testing }
PPMarkdownNode >> isSpan [
	^ false
]

{ #category : #testing }
PPMarkdownNode >> isStrong [
	^ false
]

{ #category : #testing }
PPMarkdownNode >> isText [
	^ false
]

{ #category : #testing }
PPMarkdownNode >> isVerbatim [
	^ false
]

{ #category : #visiting }
PPMarkdownNode >> visit: aVisitor [
	self subclassResponsibility
]
