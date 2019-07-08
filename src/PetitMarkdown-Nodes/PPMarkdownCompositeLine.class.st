"
A PPMarkdownCompositeLine is an abstract superclass for lines that have a prefix and an inner line of a simpler type.
"
Class {
	#name : #PPMarkdownCompositeLine,
	#superclass : #PPMarkdownLine,
	#instVars : [
		'rest'
	],
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #'instance creation' }
PPMarkdownCompositeLine class >> with: aMarkdownLine [ 
	^ self new setRest: aMarkdownLine
]

{ #category : #accessing }
PPMarkdownCompositeLine >> content [
	^ rest content
]

{ #category : #accessing }
PPMarkdownCompositeLine >> inner [
	^ rest
]

{ #category : #testing }
PPMarkdownCompositeLine >> isPrefixed [
	^ true
]

{ #category : #printing }
PPMarkdownCompositeLine >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self content;
		nextPut: $)
]

{ #category : #initialization }
PPMarkdownCompositeLine >> setRest: aMarkdownLine [ 
	rest := aMarkdownLine
]
