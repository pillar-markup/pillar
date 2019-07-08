"
A PPMarkdownTextLine contains only text, with inline markup.
"
Class {
	#name : #PPMarkdownTextLine,
	#superclass : #PPMarkdownLine,
	#instVars : [
		'content'
	],
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #'instance creation' }
PPMarkdownTextLine class >> with: aString [ 
	^ self new setContent: aString
]

{ #category : #'document building' }
PPMarkdownTextLine >> appendTo: node in: parentNode [
	node appendTextLine: self in: parentNode
]

{ #category : #accessing }
PPMarkdownTextLine >> content [
	^ content
]

{ #category : #printing }
PPMarkdownTextLine >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: content;
		nextPut: $)
]

{ #category : #initialization }
PPMarkdownTextLine >> setContent: aString [ 
	content := aString
]
