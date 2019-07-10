"
I'm a Figure, i can have a label in parameter. My alias (coming from the superclass) represents the figure caption
"
Class {
	#name : #PRFigure,
	#superclass : #PRReference,
	#category : #'Pillar-Model-Minimal'
}

{ #category : #testing }
PRFigure class >> extensionOf: aString isOneOf: extensions [
	| extension |
	extension := (aString splitOn: $.) last asLowercase.
	^ extensions includes: extension
]

{ #category : #testing }
PRFigure class >> isAbstract [
	^ false
]

{ #category : #testing }
PRFigure class >> isValidReference: aString [
	^ (self extensionOf: aString isOneOf: self pictureExtensions)
		and: [ aString includesSubstring: '://' caseSensitive: true ]
]

{ #category : #private }
PRFigure class >> pictureExtensions [
	^ #('png' 'jpg' 'jpeg' 'pdf')
]

{ #category : #visiting }
PRFigure >> accept: aVisitor [
	aVisitor visitFigure: self
]

{ #category : #testing }
PRFigure >> hasCaption [
	^ self hasChildren
]

{ #category : #testing }
PRFigure >> hasLabel [
	^ self label isNotNil
]

{ #category : #accessing }
PRFigure >> label [
	^ self parameters at: 'label' ifAbsent: [ nil ]
]

{ #category : #accessing }
PRFigure >> label: aString [
	self parameters at: 'label' put: aString
]
