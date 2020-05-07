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
PRValidatorVisitorTest >> testErrorTwoAnchorsSameNameWithFigure [

	| doc validator | 
	doc := PRPillarParserMain parse: '
@UseCustom
The first anchor is declared

See this figure *@UseCustom*

+Use Custom SSH keys settings.>file://figures/useCustom.png|width=75|label=UseCustom+
	'.
	validator := PRValidatorVisitor new.
	validator start: doc.
	self assert: validator isFailure.
	self assert: validator allTestsResults first specification equals: 'UseCustom'
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
PRValidatorVisitorTest >> testIdentifiesFigure [
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
PRValidatorVisitorTest >> testOneReferenceRefersToASingleFigure [

	| doc validator | 
	doc := PRPillarParserMain parse: '
See this figure *@UseCustom*
+Use Custom SSH keys settings.>file://figures/useCustom.png|width=75|label=UseCustom+
	'.
	validator := PRValidatorVisitor new.
	validator start: doc.
	self assert: validator isSuccess.
	self assert: validator anchors first equals: 'UseCustom'.
	self assert: validator references first equals: 'UseCustom'
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
