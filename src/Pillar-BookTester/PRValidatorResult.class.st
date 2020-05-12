"
I represent an error result raised by PRValidator.

I am composed of:
- an explanation (of my error)
- a specification (the name of concerned file or reference)

All recognized error explanation are in allResult dictionary.

Use my constructor to instantiate me.

"
Class {
	#name : #PRValidatorResult,
	#superclass : #PRVisitor,
	#instVars : [
		'explanation',
		'specification'
	],
	#classInstVars : [
		'allResults'
	],
	#category : #'Pillar-BookTester-Visitor'
}

{ #category : #'as yet unclassified' }
PRValidatorResult class >> allResults [
	^ allResults ifNil: [ 
		allResults := Dictionary new.
		allResults
			at: #anchorIsMissing put: 'A reference refers to a missing anchor';
			at: #twoAnchorsSameNameRelativeToFigure put: 'A figure is declared with a label already declared as an anchor or another figure label';
			at: #twoAnchorsSameName put: '2 anchors are declared with the same name';
			at: #figureNotFound put: 'Figure not found in internal files';
			at: #figureIncorrectExtension put: 'A figure is declared with an unrecognized picture extension';
			at: #inputFileNotFound put: 'File invoked in an input file annotation not found'.
		^ allResults ]
]

{ #category : #'as yet unclassified' }
PRValidatorResult class >> explanation: aMethodSymbol withSpecification: aSpecification [
	^ self new explanation: (self allResults at: aMethodSymbol); specification: aSpecification asString; yourself.
]

{ #category : #accessing }
PRValidatorResult >> explanation [
	^ explanation
]

{ #category : #accessing }
PRValidatorResult >> explanation: aString [
	explanation := aString
]

{ #category : #printing }
PRValidatorResult >> printOn: aStream [
	aStream nextPutAll: 'Error explanation: "', self explanation asString, '", with specification: "', self specification asString, '"'
	
]

{ #category : #accessing }
PRValidatorResult >> specification [
	^ specification
]

{ #category : #accessing }
PRValidatorResult >> specification: aString [
	specification := aString
]
