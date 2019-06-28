"
PPMarkdownInlinesNode is the superclass for block-level nodes that contain inline markup.
"
Class {
	#name : #PPMarkdownInlinesNode,
	#superclass : #PPMarkdownBlockNode,
	#instVars : [
		'contents',
		'inlines'
	],
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #accessing }
PPMarkdownInlinesNode >> contents [
	^ contents
]

{ #category : #initialization }
PPMarkdownInlinesNode >> finishUp [
	self notYetImplemented.
	"contents := PPMarkdownInlineParser parse: contents"
]

{ #category : #initialization }
PPMarkdownInlinesNode >> initializeWithContent: aNodeOrString [
	"If initialized with a bare unparsed string, the object will be invalid for normal use until #finishUp is called" 
	contents := aNodeOrString
]

{ #category : #accessing }
PPMarkdownInlinesNode >> inlines [
	^ inlines
]

{ #category : #accessing }
PPMarkdownInlinesNode >> inlines: aCollection [ 
	inlines := aCollection
]
