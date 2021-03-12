Class {
	#name : #PRParseAbstractAnnotationTest2,
	#superclass : #PRParseDocumentItemTest2,
	#category : #'Pillar-Tests-Core-Parse'
}

{ #category : #testing }
PRParseAbstractAnnotationTest2 class >> isAbstract [
	^ self = PRAbstractAnnotationTest
]

{ #category : #helpers }
PRParseAbstractAnnotationTest2 >> actualClass [
	^ self subclassResponsibility
]

{ #category : #helpers }
PRParseAbstractAnnotationTest2 >> annoteName [
	^ self actualClass tag
]

{ #category : #helpers }
PRParseAbstractAnnotationTest2 >> referenceParameters [
	self subclassResponsibility
]

{ #category : #helpers }
PRParseAbstractAnnotationTest2 >> referenceString [
	"Pay attention to order the parameters according to sorted"
	self
		subclassResponsibility
]

{ #category : #tests }
PRParseAbstractAnnotationTest2 >> testAsPillar [
	| wiki tree |
	wiki := '${' , self referenceString , '}$'.
	tree := self actualClass withParameters: self referenceParameters.
	self assert: tree asPillar equals: wiki
]

{ #category : #tests }
PRParseAbstractAnnotationTest2 >> testParse [
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
PRParseAbstractAnnotationTest2 >> testParsedHadAllKeys [

	self assert: (self parser parse:  '${' , self referenceString , '}$') children first children first hadAllKeys
]

{ #category : #tests }
PRParseAbstractAnnotationTest2 >> testWithParameters [

	self assert: (self actualClass withParameters: self referenceParameters) hadAllKeys
]
