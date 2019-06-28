"
A PPMarkdownBlockQuote is a citation block; any other block-level node can be nested in it.
"
Class {
	#name : #PPMarkdownBlockQuote,
	#superclass : #PPMarkdownCompositeNode,
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #'document building' }
PPMarkdownBlockQuote >> appendBlankLine: line in: parentNode [ 
	parentNode newBlock
]

{ #category : #visiting }
PPMarkdownBlockQuote >> visit: aVisitor [
	^ aVisitor acceptBlockQuote: self.
]
