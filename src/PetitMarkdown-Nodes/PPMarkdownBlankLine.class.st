"
A PPMarkdownBlankLine represents a single blank line in the markdown source.
"
Class {
	#name : #PPMarkdownBlankLine,
	#superclass : #PPMarkdownTextLine,
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #'document building' }
PPMarkdownBlankLine >> appendTo: node in: parentNode [
	node appendBlankLine: self in: parentNode
]

{ #category : #testing }
PPMarkdownBlankLine >> isBlank [
	^ true
]
