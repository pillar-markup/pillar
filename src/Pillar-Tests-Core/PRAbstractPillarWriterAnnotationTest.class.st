Class {
	#name : #PRAbstractPillarWriterAnnotationTest,
	#superclass : #PRPillarWriterDocumentItemTest4,
	#category : #'Pillar-Tests-Core-PillarWriter'
}

{ #category : #testing }
PRAbstractPillarWriterAnnotationTest class >> isAbstract [
	^ self = PRAbstractPillarWriterAnnotationTest
]

{ #category : #helpers }
PRAbstractPillarWriterAnnotationTest >> annoteName [
	^ self actualClass tag
]

{ #category : #tests }
PRAbstractPillarWriterAnnotationTest >> referenceParameters [
	self subclassResponsibility
]

{ #category : #helpers }
PRAbstractPillarWriterAnnotationTest >> referenceString [
	"Pay attention to order the parameters according to sorted"
	
	self subclassResponsibility
]

{ #category : #tests }
PRAbstractPillarWriterAnnotationTest >> testParagraphWithParameters [
	| wiki tree |
	wiki := '${' , self referenceString , '}$'.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (self actualClass withParameters: self referenceParameters);
				yourself);
		yourself.

	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]
