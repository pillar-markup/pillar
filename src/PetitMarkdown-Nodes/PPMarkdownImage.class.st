Class {
	#name : #PPMarkdownImage,
	#superclass : #PPMarkdownInlineNode,
	#instVars : [
		'source'
	],
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #visiting }
PPMarkdownImage >> visit: aVisitor [
	^ aVisitor acceptImage: self.
]
