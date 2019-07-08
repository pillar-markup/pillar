"
A PPMarkdownIndentLine represents indented lines.
"
Class {
	#name : #PPMarkdownIndentLine,
	#superclass : #PPMarkdownCompositeLine,
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #'document building' }
PPMarkdownIndentLine >> appendTo: node in: parentNode [
	node appendIndentLine: self in: parent
]

{ #category : #accessing }
PPMarkdownIndentLine >> indentLevel [
	^ rest indentLevel + 1
]

{ #category : #testing }
PPMarkdownIndentLine >> isIndented [
	^ true
]
