Class {
	#name : #PRValidatorVisitorTest,
	#superclass : #TestCase,
	#category : #'Pillar-Tests-BookTester'
}

{ #category : #tests }
PRValidatorVisitorTest >> setUp [
	"Create a setup directory with: figures/test.png"
	| workingDir |
	workingDir := FileSystem workingDirectory .
	(workingDir / 'validator_figures' / 'useCustom.png') ensureCreateFile 
]

{ #category : #tests }
PRValidatorVisitorTest >> tearDown [
	(FileSystem workingDirectory / 'validator_figures') deleteAll.
]

{ #category : #tests }
PRValidatorVisitorTest >> testErrorFigureUnfound [
	| doc validator |
	doc := PRPillarParserMain parse: '
+Use Custom SSH keys settings.>file://validator_figures/unfoundPic.png|width=75+
'.
	validator := PRValidatorVisitor new.
	validator start: doc.
	self assert: validator isFailure.
	self assert: validator allTestsResults first specification equals: 'file://validator_figures/unfoundPic.png'
]

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
PRValidatorVisitorTest >> testFigureExists [
	| doc validator |
	doc := PRPillarParserMain parse: '
+A description.>file://validator_figures/useCustom.png|width=75|label=UseCustom+
'.
	validator := PRValidatorVisitor new.
	validator start: doc.
	self assert: validator isSuccess.
	self assert: validator anchors isNotEmpty.
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
	| doc validator |
	doc := PRPillarParserMain parse: '
+Use Custom SSH keys settings.>file://validator_figures/useCustom.png|width=75|label=UseCustom+
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
PRValidatorVisitorTest >> testOneReferenceRefersToASingleFigure [

	| doc validator | 
	doc := PRPillarParserMain parse: '
See this figure *@UseCustom*
+Use Custom SSH keys settings.>file://validator_figures/useCustom.png|width=75|label=UseCustom+
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
