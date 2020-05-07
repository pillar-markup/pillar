Class {
	#name : #PRValidatorVisitorTest,
	#superclass : #TestCase,
	#category : #'Pillar-Tests-BookTester'
}

{ #category : #tests }
PRValidatorVisitorTest >> testErrorMissingAnchor [

	| doc validator |
	doc := PRPillarParserMain parse: '
A reference to header *@secheader1*
	'.
	validator := PRValidatorVisitor new.
	validator start: doc.
	self assert: validator isFailure.
	self assert: validator allTestsResults first specification equals: 'secheader1'
	
]

{ #category : #tests }
PRValidatorVisitorTest >> testErrorTwoAnchorsSameName [

	| doc validator |
	doc := PRPillarParserMain parse: '
# Header1
@secheader1

#Header 2
@secheader1
	
A reference to header *@secheader1*
	'.
	validator := PRValidatorVisitor new.
	validator start: doc.
	self assert: validator isFailure.
	self assert: validator allTestsResults first specification equals: 'secheader1'
	
]

{ #category : #tests }
PRValidatorVisitorTest >> testIdentifiesAnchor [

	| doc validator |
	doc := PRPillarParserMain parse: '
# Header1
@secheader1
	
A reference to header *@secheader1*
'.
	validator := PRValidatorVisitor new.
	validator start: doc.
	self assert: validator isSuccess.
	self assert: validator anchors isNotEmpty.
	
]

{ #category : #tests }
PRValidatorVisitorTest >> testOneReferenceRefersToASingleAnchor [

	| doc validator | 
	doc := PRPillarParserMain parse: '
# Header1
@secheader1
	
A reference to header *@secheader1*
	'.
	validator := PRValidatorVisitor new.
	validator start: doc.
	self assert: validator isSuccess.
	self assert: validator anchors equals: validator references.
	
]

{ #category : #tests }
PRValidatorVisitorTest >> testTwoReferencesReferToASingleAnchor [

	| doc validator | 
	doc := PRPillarParserMain parse: '
# Header1
@secheader1
	
A reference to header *@secheader1*
Another reference to header *@secheader1*
	'.
	validator := PRValidatorVisitor new.
	validator start: doc.
	self assert: validator isSuccess.
	self assert: validator references size equals: 2.
	self assert: validator anchors size equals: 1.
]
