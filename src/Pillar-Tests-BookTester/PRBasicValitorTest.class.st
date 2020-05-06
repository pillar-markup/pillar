Class {
	#name : #PRBasicValitorTest,
	#superclass : #TestCase,
	#category : #'Pillar-Tests-BookTester'
}

{ #category : #tests }
PRBasicValitorTest >> testOneReferenceRefersToASingleAnchor [

	| doc validator | 
	doc := PRPillarParserMain parse: '
	
	Figure *@UseCustom* shows bla. 
	
	+Use Custom SSH keys settings.>file://figures/useCustom.png|width=75|label=UseCustom+
	'.
	validator := PRValidatorVisitor new.
	validator start: doc.
	self assert: validator isSuccess
	
]

{ #category : #tests }
PRBasicValitorTest >> testTwoReferencesReferToASingleAnchor [

	| doc validator | 
	doc := PRPillarParserMain parse: '
	
	Figure *@UseCustom* shows bla. 
	Figure *@UseCustom* shows bla. 
	
	+Use Custom SSH keys settings.>file://figures/useCustom.png|width=75|label=UseCustom+
	'.
	validator := PRValidatorVisitor new.
	validator start: doc.
	self assert: validator isSuccess
	
]

{ #category : #tests }
PRBasicValitorTest >> testValidatorIdentifiesAnchor [

	| doc validator |
	doc := PRPillarParserMain parse: '
	
	# Header1
	@secheader1
	

	A reference to header *@secheader1*
	'.
	validator := PRValidatorVisitor new start: doc.
	self assert: validator isSuccess
	
]

{ #category : #tests }
PRBasicValitorTest >> testValidatorIdentifiesDoubleAnchorClash [

	| doc validator |
	doc := PRPillarParserMain parse: '
	
	Figure *@UseCustom* shows bla. 
	
	+Use Custom SSH keys settings2 .>file://figures/useCustom.png|width=75|label=UseCustom+
	
	+Use Custom SSH keys settings.>file://figures/useCustom.png|width=75|label=UseCustom+
	'.
	validator := PRValidatorVisitor new start: doc.
	self assert: validator isFailure
	
]
