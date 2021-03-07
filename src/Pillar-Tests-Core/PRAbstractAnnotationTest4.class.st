Class {
	#name : #PRAbstractAnnotationTest4,
	#superclass : #PRPillarWriterDocumentItemTest4,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRAbstractAnnotationTest4 class >> isAbstract [
	^ self = PRAbstractAnnotationTest4
]

{ #category : #helpers }
PRAbstractAnnotationTest4 >> actualClass [
	^ self subclassResponsibility
]

{ #category : #helpers }
PRAbstractAnnotationTest4 >> annoteName [
	^ self actualClass tag
]

{ #category : #helpers }
PRAbstractAnnotationTest4 >> referenceParameters [
	self subclassResponsibility
]

{ #category : #helpers }
PRAbstractAnnotationTest4 >> referenceString [
	"Pay attention to order the parameters according to sorted"
	self
		subclassResponsibility
]

{ #category : #tests }
PRAbstractAnnotationTest4 >> testAsPillar [
	| wiki tree |
	wiki := '${' , self referenceString , '}$'.
	tree := self actualClass withParameters: self referenceParameters.
	self assert: tree asPillar equals: wiki
]

{ #category : #tests }
PRAbstractAnnotationTest4 >> testParse [
	| wiki tree |
	wiki := '${' , self referenceString , '}$'.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (self actualClass withParameters: self referenceParameters);
				yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	
	
]

{ #category : #tests }
PRAbstractAnnotationTest4 >> testParsedHadAllKeys [

	self assert: (self parser parse:  '${' , self referenceString , '}$') children first children first hadAllKeys
]
