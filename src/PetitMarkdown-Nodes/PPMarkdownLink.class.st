Class {
	#name : #PPMarkdownLink,
	#superclass : #PPMarkdownInlineNode,
	#instVars : [
		'label',
		'url'
	],
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #testing }
PPMarkdownLink >> isLink [
	^ true
]

{ #category : #accessing }
PPMarkdownLink >> label [
	^ label
]

{ #category : #accessing }
PPMarkdownLink >> label: anObject [
	label := anObject
]

{ #category : #accessing }
PPMarkdownLink >> url [
	^ url
]

{ #category : #accessing }
PPMarkdownLink >> url: anObject [
	url := anObject
]

{ #category : #visiting }
PPMarkdownLink >> visit: aVisitor [
	^ aVisitor acceptLink: self.
]
