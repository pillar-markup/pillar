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
PRValidatorResult class >> anchorIsMissing: anAnchorName [
	^ self new specification: anAnchorName ; explanation: 'A reference refers to a missing anchor'
]

{ #category : #'as yet unclassified' }
PRValidatorResult class >> twoAnchorsRelativeToFigureSameNameWith: aFigureLabel [
	^ self new specification: aFigureLabel ; explanation: '2 anchors relative to a figure are declared with the same name'
]

{ #category : #'as yet unclassified' }
PRValidatorResult class >> twoAnchorsSameNameWith: anAnchorName [
	^ self new specification: anAnchorName ; explanation: '2 anchors are declared with the same name'
	
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
