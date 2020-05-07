Class {
	#name : #PRValidatorResult,
	#superclass : #PRVisitor,
	#instVars : [
		'explanation',
		'specification'
	],
	#category : #'Pillar-BookTester-Visitor'
}

{ #category : #'as yet unclassified' }
PRValidatorResult class >> allResults [
	| allResults |
	allResults := Dictionary new.
	allResults
		at: #anchorIsMissing put: 'A reference refers to a missing anchor';
		at: #twoAnchorsSameNameRelativeToFigure put: 'A figure is declared with a label already declared as an anchor or another figure label';
		at: #twoAnchorsSameName put: '2 anchors are declared with the same name'.
	^ allResults
]

{ #category : #'as yet unclassified' }
PRValidatorResult class >> explanation: aMethodSymbol withSpecification: aString [
	^ self new explanation: (self allResults at: aMethodSymbol); specification: aString; yourself.
]

{ #category : #'as yet unclassified' }
PRValidatorResult >> anchorIsMissing [
]

{ #category : #accessing }
PRValidatorResult >> explanation [
	^ explanation
]

{ #category : #accessing }
PRValidatorResult >> explanation: aString [
	explanation := aString
]

{ #category : #accessing }
PRValidatorResult >> specification [
	^ specification
]

{ #category : #accessing }
PRValidatorResult >> specification: aString [
	specification := aString
]
