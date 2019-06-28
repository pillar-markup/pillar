Class {
	#name : #PPMarkdownCode,
	#superclass : #PPMarkdownInlineNode,
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #'as yet unclassified' }
PPMarkdownCode >> code [
	^ text
]

{ #category : #testing }
PPMarkdownCode >> isCode [
	^ true
]

{ #category : #visiting }
PPMarkdownCode >> visit: aVisitor [
	^ aVisitor acceptCode: self.
]
