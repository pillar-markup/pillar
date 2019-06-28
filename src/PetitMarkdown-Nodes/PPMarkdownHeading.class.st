"
A PPMarkdownHeading is a sectioning title. Instvar level matches the HTML numbering.
"
Class {
	#name : #PPMarkdownHeading,
	#superclass : #PPMarkdownInlinesNode,
	#instVars : [
		'level'
	],
	#category : #'PetitMarkdown-Nodes'
}

{ #category : #accessing }
PPMarkdownHeading >> level [
	^ level
]

{ #category : #accessing }
PPMarkdownHeading >> level: anInteger [
	self assert: (anInteger between: 1 and: 6).
	level := anInteger
]

{ #category : #visiting }
PPMarkdownHeading >> visit: aVisitor [
	aVisitor acceptHeading: self.
]
