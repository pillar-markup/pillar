"
A PPMarkdownUnorderedList is a simple itemized list.
"
Class {
	#name : #PPMarkdownUnorderedList,
	#superclass : #PPMarkdownList,
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #visiting }
PPMarkdownUnorderedList >> visit: aVisitor [
	^ aVisitor acceptUnorderedList: self.
]
