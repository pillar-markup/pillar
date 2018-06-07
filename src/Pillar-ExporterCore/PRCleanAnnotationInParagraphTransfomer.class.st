"
When a paragraph only contains an annotation, I remove the paragraph so the annotation becomes a top-level child of the document.
"
Class {
	#name : #PRCleanAnnotationInParagraphTransfomer,
	#superclass : #PRNodeTransformer,
	#instVars : [
		'goal'
	],
	#category : 'Pillar-ExporterCore-Export'
}

{ #category : #accessing }
PRCleanAnnotationInParagraphTransfomer >> goal: aPRBuildGoal [ 
	
	goal := aPRBuildGoal
]

{ #category : #testing }
PRCleanAnnotationInParagraphTransfomer >> paragraphIsSingleton: aParagraph [
	^ aParagraph children size = 1
		or: [ self paragraphJustContainsALineBreakMore: aParagraph ]
]

{ #category : #testing }
PRCleanAnnotationInParagraphTransfomer >> paragraphJustContainsALineBreakMore: aParagraph [
	^ aParagraph children size = 2
		and: [ aParagraph children second isKindOf: PRLineBreak ]
]

{ #category : #testing }
PRCleanAnnotationInParagraphTransfomer >> paragraphOnlyContainsAnnotation: aParagraph [
	^ ((aParagraph children size between: 1 and: 2) and: [ aParagraph children first isKindOf: PRAbstractAnnotation ])
		and: [ self paragraphIsSingleton: aParagraph ]
]

{ #category : #'visiting-document' }
PRCleanAnnotationInParagraphTransfomer >> visitParagraph: aParagraph [
	(self paragraphOnlyContainsAnnotation: aParagraph)
		ifTrue: [ self replace: {aParagraph children first} ]
]
