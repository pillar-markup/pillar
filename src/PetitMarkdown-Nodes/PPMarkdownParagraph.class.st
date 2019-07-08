"
A PPMarkdownParagraph is a basic paragraph of text, with inline formatting.
"
Class {
	#name : #PPMarkdownParagraph,
	#superclass : #PPMarkdownInlinesNode,
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #'document building' }
PPMarkdownParagraph >> appendBlankLine: line in: parent [ 
	parent closeParagraph: self
]

{ #category : #'document building' }
PPMarkdownParagraph >> appendTextLine: line in: parentNode [ 
	"assumes we're still in the building stage and inlines is a string"
	inlines := inlines , line content
]

{ #category : #visiting }
PPMarkdownParagraph >> visit: aVisitor [
	aVisitor acceptParagraph: self.
]
