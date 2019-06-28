Class {
	#name : #PPMarkdownEmphasis,
	#superclass : #PPMarkdownInlineNode,
	#instVars : [
		'inlines'
	],
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #accessing }
PPMarkdownEmphasis >> inlines [
	^ inlines
]

{ #category : #accessing }
PPMarkdownEmphasis >> inlines: anObject [
	inlines := anObject
]

{ #category : #testing }
PPMarkdownEmphasis >> isEmphasis [
	^ true
]

{ #category : #visiting }
PPMarkdownEmphasis >> visit: aVisitor [
	^ aVisitor acceptEmphasis: self. 
]
