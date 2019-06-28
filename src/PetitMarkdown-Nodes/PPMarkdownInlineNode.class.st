Class {
	#name : #PPMarkdownInlineNode,
	#superclass : #PPMarkdownNode,
	#instVars : [
		'text'
	],
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #'as yet unclassified' }
PPMarkdownInlineNode class >> with: aString [
	^ self new
		text: aString;
		yourself
]

{ #category : #testing }
PPMarkdownInlineNode >> isSpan [
	^ true
]

{ #category : #accessing }
PPMarkdownInlineNode >> text [
	^ text
]

{ #category : #accessing }
PPMarkdownInlineNode >> text: anObject [
	text := anObject
]
