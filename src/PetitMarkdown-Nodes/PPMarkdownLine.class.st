"
A PPMarkdownLine represents one line of input markup, according to the kind of prefix it has.
PPMarkdownLine instances get fused into blocks and proper document elements in a further analysis pass.
"
Class {
	#name : #PPMarkdownLine,
	#superclass : #Object,
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #'document building' }
PPMarkdownLine >> appendTo: node in: parentNode [
	self subclassResponsibility
]

{ #category : #accessing }
PPMarkdownLine >> content [
	^ self subclassResponsibility
]

{ #category : #accessing }
PPMarkdownLine >> indentLevel [
	^ 0
]

{ #category : #testing }
PPMarkdownLine >> isBlank [
	^ false
]

{ #category : #testing }
PPMarkdownLine >> isHeading [
	^ false
]

{ #category : #testing }
PPMarkdownLine >> isIndented [
	^ false
]

{ #category : #testing }
PPMarkdownLine >> isPrefixed [
	^ false
]

{ #category : #testing }
PPMarkdownLine >> isQuoted [
	^ false
]

{ #category : #accessing }
PPMarkdownLine >> quoteLevel [
	^ 0
]
