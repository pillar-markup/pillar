Class {
	#name : #PPMarkdownStrong,
	#superclass : #PPMarkdownInlineNode,
	#instVars : [
		'inlines'
	],
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #accessing }
PPMarkdownStrong >> inlines [
	^ inlines
]

{ #category : #accessing }
PPMarkdownStrong >> inlines: anObject [
	inlines := anObject
]

{ #category : #testing }
PPMarkdownStrong >> isStrong [
	^ true
]

{ #category : #visiting }
PPMarkdownStrong >> visit: aVisitor [
	^ aVisitor acceptStrong: self.
]
