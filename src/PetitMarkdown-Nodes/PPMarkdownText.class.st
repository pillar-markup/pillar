Class {
	#name : #PPMarkdownText,
	#superclass : #PPMarkdownInlineNode,
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #concatenating }
PPMarkdownText >> , aText [ 
	^ self class new text: self text asString, aText text asString
]

{ #category : #testing }
PPMarkdownText >> isText [
	^ true
]

{ #category : #'as yet unclassified' }
PPMarkdownText >> printOn: aStream [
	aStream store: text
]

{ #category : #visiting }
PPMarkdownText >> visit: aVisitor [
	^ aVisitor acceptText: self.
]
