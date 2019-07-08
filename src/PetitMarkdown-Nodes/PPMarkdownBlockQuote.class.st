"
A PPMarkdownBlockQuote is a citation block; any other block-level node can be nested in it.
"
Class {
	#name : #PPMarkdownBlockQuote,
	#superclass : #PPMarkdownCompositeNode,
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #'instance creation' }
PPMarkdownBlockQuote class >> text: aString [
	^ self new text: aString
]

{ #category : #'document building' }
PPMarkdownBlockQuote >> appendBlankLine: line in: parentNode [ 
	parentNode newBlock
]

{ #category : #accessing }
PPMarkdownBlockQuote >> text [
	^ children
]

{ #category : #accessing }
PPMarkdownBlockQuote >> text: aString [
	children := aString
]

{ #category : #visiting }
PPMarkdownBlockQuote >> visit: aVisitor [
	^ aVisitor acceptBlockQuote: self.
]
