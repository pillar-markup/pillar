Class {
	#name : #PRAbstractAnnotationTest3,
	#superclass : #PRTextWriterDocumentItemTest3,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRAbstractAnnotationTest3 class >> isAbstract [
	^ self = PRAbstractAnnotationTest3
]

{ #category : #helpers }
PRAbstractAnnotationTest3 >> actualClass [
	^ self subclassResponsibility
]

{ #category : #helpers }
PRAbstractAnnotationTest3 >> annoteName [
	^ self actualClass tag
]

{ #category : #helpers }
PRAbstractAnnotationTest3 >> referenceParameters [
	self subclassResponsibility
]

{ #category : #helpers }
PRAbstractAnnotationTest3 >> referenceString [
	"Pay attention to order the parameters according to sorted"
	self
		subclassResponsibility
]

{ #category : #tests }
PRAbstractAnnotationTest3 >> testAsPillar [
	| wiki tree |
	wiki := '${' , self referenceString , '}$'.
	tree := self actualClass withParameters: self referenceParameters.
	self assert: tree asPillar equals: wiki
]

{ #category : #tests }
PRAbstractAnnotationTest3 >> testParse [
	| wiki tree |
	wiki := '${' , self referenceString , '}$'.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (self actualClass withParameters: self referenceParameters);
				yourself);
		yourself.
	self parserAssertWiki: wiki equalsTree: tree.
	self pillarWriterAssertTree: tree equalsWiki: wiki.
	
]

{ #category : #tests }
PRAbstractAnnotationTest3 >> testParsedHadAllKeys [

	self assert: (self parser parse:  '${' , self referenceString , '}$') children first children first hadAllKeys
]

{ #category : #tests }
PRAbstractAnnotationTest3 >> testWithParameters [

	self assert: (self actualClass withParameters: self referenceParameters) hadAllKeys
]
