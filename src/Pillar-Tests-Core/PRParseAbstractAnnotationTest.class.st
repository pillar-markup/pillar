Class {
	#name : #PRParseAbstractAnnotationTest,
	#superclass : #PRParseDocumentItemTest2,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRParseAbstractAnnotationTest class >> isAbstract [
	^ self = PRParseAbstractAnnotationTest
]

{ #category : #helpers }
PRParseAbstractAnnotationTest >> actualClass [
	^ self subclassResponsibility
]

{ #category : #helpers }
PRParseAbstractAnnotationTest >> annoteName [
	^ self actualClass tag
]

{ #category : #helpers }
PRParseAbstractAnnotationTest >> referenceParameters [
	self subclassResponsibility
]

{ #category : #helpers }
PRParseAbstractAnnotationTest >> referenceString [
	"Pay attention to order the parameters according to sorted"
	self
		subclassResponsibility
]

{ #category : #tests }
PRParseAbstractAnnotationTest >> testParse [
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
PRParseAbstractAnnotationTest >> testParsedHadAllKeys [

	self assert: (self parser parse:  '${' , self referenceString , '}$') children first children first hadAllKeys
]
