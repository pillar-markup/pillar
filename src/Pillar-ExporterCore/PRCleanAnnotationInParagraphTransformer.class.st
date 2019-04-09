"
When a paragraph only contains an annotation, I remove the paragraph so the annotation becomes a top-level child of the document.
"
Class {
	#name : #PRCleanAnnotationInParagraphTransformer,
	#superclass : #PRNodeTransformer,
	#instVars : [
		'goal'
	],
	#category : #'Pillar-ExporterCore-Transformers'
}

{ #category : #accessing }
PRCleanAnnotationInParagraphTransformer >> goal: aPRBuildGoal [ 
	
	goal := aPRBuildGoal
]

{ #category : #testing }
PRCleanAnnotationInParagraphTransformer >> paragraphIsSingleton: aParagraph [
	^ aParagraph children size = 1
		or: [ self paragraphJustContainsALineBreakMore: aParagraph ]
]

{ #category : #testing }
PRCleanAnnotationInParagraphTransformer >> paragraphJustContainsALineBreakMore: aParagraph [
	^ aParagraph children size = 2
		and: [ aParagraph children second isKindOf: PRLineBreak ]
]

{ #category : #testing }
PRCleanAnnotationInParagraphTransformer >> paragraphOnlyContainsAnnotation: aParagraph [
	^ ((aParagraph children size between: 1 and: 2) and: [ aParagraph children first isKindOf: PRAbstractAnnotation ])
		and: [ self paragraphIsSingleton: aParagraph ]
]

{ #category : #'visiting-document' }
PRCleanAnnotationInParagraphTransformer >> visitParagraph: aParagraph [
	(self paragraphOnlyContainsAnnotation: aParagraph)
		ifTrue: [ self replace: {aParagraph children first} ]
]
