"
A PPMarkdownVerbatim represents a block of text to be displayed as-is; contents is just plain text.
"
Class {
	#name : #PPMarkdownVerbatim,
	#superclass : #PPMarkdownBlockNode,
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #'document building' }
PPMarkdownVerbatim >> appendBlankLine: line in: parentNode [ 
	parentNode closeVerbatim: self
]

{ #category : #'document building' }
PPMarkdownVerbatim >> appendTextLine: line in: parentNode [ 
	text := text , String lf , line content
]

{ #category : #testing }
PPMarkdownVerbatim >> isVerbatim [
	^ true
]

{ #category : #accessing }
PPMarkdownVerbatim >> text [
	^ text
]

{ #category : #accessing }
PPMarkdownVerbatim >> text: anObject [
	text := anObject
]

{ #category : #visiting }
PPMarkdownVerbatim >> visit: aVisitor [
	^ aVisitor acceptVerbatim: self.
]
