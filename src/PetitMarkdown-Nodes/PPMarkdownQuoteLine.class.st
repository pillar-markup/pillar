"
A PPMarkdownQuoteLine represents lines starting with the blockquote mark.
"
Class {
	#name : #PPMarkdownQuoteLine,
	#superclass : #PPMarkdownCompositeLine,
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #'as yet unclassified' }
PPMarkdownQuoteLine >> appendTo: node in: parentNode [
	node appendQuoteLine: self in: parentNode
]

{ #category : #testing }
PPMarkdownQuoteLine >> isQuoted [
	^ true
]

{ #category : #accessing }
PPMarkdownQuoteLine >> quoteLevel [
	^ rest quoteLevel + 1
]
