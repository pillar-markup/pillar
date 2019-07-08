Class {
	#name : #PPMarkdownEntity,
	#superclass : #PPMarkdownInlineNode,
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #'as yet unclassified' }
PPMarkdownEntity >> entity [
	^ text
]

{ #category : #'as yet unclassified' }
PPMarkdownEntity >> visit: aVisitor [
	^ aVisitor acceptEntity: self.
]
