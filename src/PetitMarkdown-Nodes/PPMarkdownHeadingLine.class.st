Class {
	#name : #PPMarkdownHeadingLine,
	#superclass : #PPMarkdownTextLine,
	#instVars : [
		'level'
	],
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #'instance creation' }
PPMarkdownHeadingLine class >> level: anInteger with: aString [
	^ (self with: aString)
		setLevel: anInteger;
		yourself
]

{ #category : #testing }
PPMarkdownHeadingLine >> isHeading [
	^ true
]

{ #category : #accessing }
PPMarkdownHeadingLine >> level [
	^ level
]

{ #category : #initialization }
PPMarkdownHeadingLine >> setLevel: anInteger [ 
	level := anInteger
]
