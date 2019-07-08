"
A PPMarkdownDocument is the root of the abstract syntax tree for a markdown document; it contains block-level nodes (subclasses of PPMarkdownBlockNode) which themselves contain inline formatting (subclasses of PPMarkdownSpanNode)
"
Class {
	#name : #PPMarkdownDocument,
	#superclass : #Object,
	#instVars : [
		'blocks'
	],
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #'instance creation' }
PPMarkdownDocument class >> lines: anArray [ 
	^ self new appendLines: anArray
]

{ #category : #'document building' }
PPMarkdownDocument >> appendBlock: aMarkdownBlock [ 
	blocks add: aMarkdownBlock
]

{ #category : #'document building' }
PPMarkdownDocument >> appendLines: lines [
	lines do: [ :each |
		each appendTo: blocks last in: self ]
]

{ #category : #'document building' }
PPMarkdownDocument >> closeParagraph: aParagraph [ 
	self newBlock
]

{ #category : #'document building' }
PPMarkdownDocument >> closeVerbatim: node [
	self newBlock
]

{ #category : #initialization }
PPMarkdownDocument >> initialize [
	blocks := OrderedCollection with: PPMarkdownNullBlock new
]

{ #category : #'document building' }
PPMarkdownDocument >> newBlock [ 
	blocks add: PPMarkdownNullBlock new
]

{ #category : #'document building' }
PPMarkdownDocument >> replace: oldNode with: newNode [
	| index |
	index := blocks
		indexOf: oldNode
		ifAbsent: [ ^ self isThisEverCalled ].
	blocks at: index put: newNode
]

{ #category : #accessing }
PPMarkdownDocument >> size [
	^ blocks size
]
