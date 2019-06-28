Class {
	#name : #PPMarkdownImage,
	#superclass : #PPMarkdownInlineNode,
	#instVars : [
		'source'
	],
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #'as yet unclassified' }
PPMarkdownImage class >> newFromLinkNode: aPPMarkdownLink [ 
	^ (self new) 
		text: aPPMarkdownLink text; 
		source: aPPMarkdownLink url;
		yourself 
]

{ #category : #visiting }
PPMarkdownImage >> isImage [ 
	^ true
]

{ #category : #accessing }
PPMarkdownImage >> source [
	^ source
]

{ #category : #accessing }
PPMarkdownImage >> source: sourceUrl [
	source := sourceUrl

]

{ #category : #visiting }
PPMarkdownImage >> visit: aVisitor [
	^ aVisitor acceptImage: self.
]
