"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State the name of the class with one line description: For example, I'm xxx the root of the hierarchy of visitor objects.

For the Responsibility part: Three sentences about my main responsibility, what I'm doing, what services do I offer.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- what is the way to create instances is a plus.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #PRAbstractAnnotationTest,
	#superclass : #PRDocumentItemTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRAbstractAnnotationTest class >> isAbstract [
	^ self = PRAbstractAnnotationTest
]

{ #category : #helpers }
PRAbstractAnnotationTest >> actualClass [
	^ self subclassResponsibility
]

{ #category : #helpers }
PRAbstractAnnotationTest >> annoteName [
	^ self actualClass tag
]

{ #category : #helpers }
PRAbstractAnnotationTest >> referenceParameters [
	self subclassResponsibility
]

{ #category : #helpers }
PRAbstractAnnotationTest >> referenceString [
	"Pay attention to order the parameters according to sorted"
	self
		subclassResponsibility
]

{ #category : #tests }
PRAbstractAnnotationTest >> testAsPillar [
	| wiki tree |
	wiki := '${' , self referenceString , '}$'.
	tree := self actualClass withParameters: self referenceParameters.
	self assert: tree asPillar equals: wiki
]

{ #category : #tests }
PRAbstractAnnotationTest >> testParse [
	| wiki tree |
	wiki := '${' , self referenceString , '}$'.
	tree := PRDocument new
		add:
			(PRParagraph new
				add: (self actualClass withParameters: self referenceParameters);
				yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	
]

{ #category : #tests }
PRAbstractAnnotationTest >> testParsedHadAllKeys [

	self assert: (self parser parse:  '${' , self referenceString , '}$') children first children first hadAllKeys
]

{ #category : #tests }
PRAbstractAnnotationTest >> testWithParameters [

	self assert: (self actualClass withParameters: self referenceParameters) hadAllKeys
]
