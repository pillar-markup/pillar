"
I am a visitor specialized for Pillar files to check if references and file calls are correct.

I gather all found issues in my variable allTestsResults. Each issue is represented by a PRValidatorResult.

finalStatus variable returns true if there isn't any issue.

"
Class {
	#name : #PRValidatorVisitor,
	#superclass : #PRVisitor,
	#instVars : [
		'anchors',
		'references',
		'allTestsResults',
		'finalStatus'
	],
	#category : #'Pillar-BookTester-Visitor'
}

{ #category : #accessing }
PRValidatorVisitor >> allTestsResults [
	^ allTestsResults 
]

{ #category : #accessing }
PRValidatorVisitor >> anchors [
	^ anchors
]

{ #category : #checking }
PRValidatorVisitor >> checkAllReferencesReferToAnExistingAnchor [
	references do: [ :each | 
			(anchors includes: each)
				ifFalse: [ allTestsResults add: (self result explanation: #anchorIsMissing withSpecification: each) ] ]
	
]

{ #category : #checking }
PRValidatorVisitor >> finalCheck [
	
	self checkAllReferencesReferToAnExistingAnchor.
]

{ #category : #accessing }
PRValidatorVisitor >> finalStatus [
	^ allTestsResults isEmpty
]

{ #category : #initialization }
PRValidatorVisitor >> initialize [

	super initialize.
	
	allTestsResults := OrderedCollection new.
	finalStatus := true.
	
	anchors := OrderedCollection new.
	references := OrderedCollection new. 
]

{ #category : #testing }
PRValidatorVisitor >> isFailure [
	^ self finalStatus not
]

{ #category : #testing }
PRValidatorVisitor >> isSuccess [
	^ self finalStatus
]

{ #category : #accessing }
PRValidatorVisitor >> references [
	^ references
]

{ #category : #accessing }
PRValidatorVisitor >> result [
	^ PRValidatorResult
]

{ #category : #visiting }
PRValidatorVisitor >> start: anObject [
	super start: anObject.
	self finalCheck.
]

{ #category : #'visiting-document' }
PRValidatorVisitor >> visitAnchor: anAnchor [
	super visitAnchor: anAnchor.
	"check if anchor has a unique name"
	(anchors includes: anAnchor name) ifTrue: [ allTestsResults add: (self result explanation: #twoAnchorsSameName withSpecification: anAnchor name ) ] ifFalse: [ anchors add: anAnchor name ].
	
	
]

{ #category : #'visiting-document' }
PRValidatorVisitor >> visitFigure: aFigure [
	super visitFigure: aFigure.
	"check if figure name considered like an anchor is unique"
	aFigure hasLabel ifTrue: [ 
		(anchors includes: aFigure label) ifTrue: [ 
			allTestsResults add: (self result explanation: #twoAnchorsSameNameRelativeToFigure withSpecification: aFigure label ) 
		] ifFalse: [ 
			anchors add: aFigure label 
		]
	].
	"check if figure exists in files"
	aFigure pathInternFile asFileReference exists ifFalse: 
		[ allTestsResults add: (self result explanation: #figureNotFound withSpecification: aFigure reference) ].
	"check if figure has correct extension"
	(aFigure hasFigureExtension) ifFalse: 
		[ allTestsResults add: (self result explanation: #figureIncorrectExtension withSpecification: aFigure reference) ]
	
]

{ #category : #'visiting-document' }
PRValidatorVisitor >> visitInputFileAnnotation: anInputFileAnnotation [
	super visitInputFileAnnotation: anInputFileAnnotation.
	"check if file with given path exists"
	(anInputFileAnnotation path) asString asFileReference exists ifFalse: [ allTestsResults add: (self result explanation: #inputFileNotFound withSpecification: anInputFileAnnotation path) ]
]

{ #category : #'visiting-document' }
PRValidatorVisitor >> visitReference: aReference [
	super visitReference: aReference.
	aReference hasAnchor ifTrue: [ references add: aReference anchor ]
]
