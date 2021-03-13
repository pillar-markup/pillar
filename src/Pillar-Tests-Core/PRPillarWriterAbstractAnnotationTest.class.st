Class {
	#name : #PRPillarWriterAbstractAnnotationTest,
	#superclass : #PRPillarWriterDocumentItemTest4,
	#category : #'Pillar-Tests-Core-PillarWriter'
}

{ #category : #testing }
PRPillarWriterAbstractAnnotationTest class >> isAbstract [
	^ self = PRPillarWriterAbstractAnnotationTest
]

{ #category : #helpers }
PRPillarWriterAbstractAnnotationTest >> annoteName [
	^ self actualClass tag
]

{ #category : #tests }
PRPillarWriterAbstractAnnotationTest >> referenceParameters [
	self subclassResponsibility
]

{ #category : #helpers }
PRPillarWriterAbstractAnnotationTest >> referenceString [
	"Pay attention to order the parameters according to sorted"
	
	self subclassResponsibility
]

{ #category : #tests }
PRPillarWriterAbstractAnnotationTest >> testParagraphWithParameters [
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

{ #category : #tests }
PRPillarWriterAbstractAnnotationTest >> testParse [
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
