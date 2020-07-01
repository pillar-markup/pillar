"
I replace each slide annotation with a slide structure.
"
Class {
	#name : #PRSlideTransformer,
	#superclass : #PRNodeTransformer,
	#instVars : [
		'currentSlide',
		'goal'
	],
	#category : #'Pillar-ExporterCore-Transformers'
}

{ #category : #'meta-data' }
PRSlideTransformer class >> dependencies [
	^ { PRCleanAnnotationInParagraphTransformer . PRColumnsTransformer }
]

{ #category : #protected }
PRSlideTransformer >> add: anObject toCurrentEnvironmentOr: aBlock [
	^ currentSlide
		ifNil: [ aBlock value ]
		ifNotNil: [ self delete.
			currentSlide add: anObject ]
]

{ #category : #accessing }
PRSlideTransformer >> goal: aPRBuildGoal [ 
	
	goal := aPRBuildGoal
]

{ #category : #visiting }
PRSlideTransformer >> start: anObject [

	"Execute column annotation before"
	super start: (PRColumnsTransformer new start: anObject).
	^ anObject
]

{ #category : #'visiting-document' }
PRSlideTransformer >> visitDocumentGroup: aGroup [
	self add: aGroup toCurrentEnvironmentOr: [ super visitDocumentGroup: aGroup ]
]

{ #category : #'visiting-document' }
PRSlideTransformer >> visitDocumentItem: anItem [
	self add: anItem toCurrentEnvironmentOr: [ super visitDocumentItem: anItem ]
]

{ #category : #'visiting-document' }
PRSlideTransformer >> visitHeader: anHeader [
	currentSlide := nil.
	super visitHeader: anHeader
]

{ #category : #'visiting-annotations' }
PRSlideTransformer >> visitSlideTitleAnnotation: anAnnotation [
	currentSlide := (PRSlide
		titled: (anAnnotation parameters at: 'title' ifAbsent: [ 'New Slide' ]))
		label: (anAnnotation parameters at: 'label' ifAbsent: [ nil ]).
	self replace: { currentSlide }
]
