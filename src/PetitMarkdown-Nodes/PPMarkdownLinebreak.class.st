Class {
	#name : #PPMarkdownLinebreak,
	#superclass : #PPMarkdownInlineNode,
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #testing }
PPMarkdownLinebreak >> isLinebreak [
	^ true
]

{ #category : #accessing }
PPMarkdownLinebreak >> text [
	^ Character lf
]

{ #category : #accessing }
PPMarkdownLinebreak >> text: aText [
	self shouldNotImplement.
]

{ #category : #visiting }
PPMarkdownLinebreak >> visit: aVisitor [
	^ aVisitor acceptLinebreak: self.
]
