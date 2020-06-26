Class {
	#name : #PRValidatorVisitorTest,
	#superclass : #TestCase,
	#category : #'Pillar-Tests-BookTester'
}

{ #category : #accessing }
PRValidatorVisitorTest >> allValidatorResults [
	^ PRValidatorResult allResults
]

{ #category : #'setup & teardown' }
PRValidatorVisitorTest >> setUp [
	"Create a setup directory with: validator_figures/useCustom.png & validator_inputFiles/my_test_file.pillar "
	| workingDir |
	workingDir := FileSystem workingDirectory .
	(workingDir / 'validator_figures' / 'useCustom.png') ensureCreateFile.
	(workingDir / 'validator_figures' / 'aFileWithNoExtension') ensureCreateFile.
	(workingDir / 'validator_inputFiles' / 'my_test_file.pillar') ensureCreateFile
]

{ #category : #'setup & teardown' }
PRValidatorVisitorTest >> tearDown [
	| workingDir |
	workingDir := FileSystem workingDirectory .
	(workingDir / 'validator_figures' ) deleteAll.
	(workingDir / 'validator_inputFiles' ) deleteAll.
]

{ #category : #'test-anchor-reference' }
PRValidatorVisitorTest >> testErrorAnchorIsMissing [

	| doc validator |
	doc := PRPillarParserMain parse: '
A reference to header *@secheader1*
	'.
	validator := PRValidatorVisitor new.
	validator start: doc.
	self assert: validator isFailure.
	self assert: validator allTestsResults first explanation equals: (self allValidatorResults at: #anchorIsMissing).
	self assert: validator allTestsResults first specification equals: 'secheader1'
	
]

{ #category : #'test-figure' }
PRValidatorVisitorTest >> testErrorFigureIncorrectExtension [

	| doc validator |
	doc := PRPillarParserMain parse: '
+A pic descripton.>file://validator_inputFiles/my_test_file.pillar+
'.
	validator := PRValidatorVisitor new.
	validator start: doc.
	self assert: validator isFailure.
	self assert: validator allTestsResults first explanation equals: (self allValidatorResults at: #figureIncorrectExtension).
	self assert: validator allTestsResults first specification equals: 'file://validator_inputFiles/my_test_file.pillar'
	
]

{ #category : #'test-figure' }
PRValidatorVisitorTest >> testErrorFigureIncorrectExtensionExtensionMissing [

	| doc validator |
	doc := PRPillarParserMain parse: '
+A pic descripton.>file://validator_figures/useCustom+
'.
	validator := PRValidatorVisitor new.
	validator start: doc.
	self assert: validator isFailure.
	self assert: validator allTestsResults first explanation equals: (self allValidatorResults at: #figureNotFound).
	self assert: validator allTestsResults first specification equals: 'file://validator_figures/useCustom'
	
]

{ #category : #'test-figure' }
PRValidatorVisitorTest >> testErrorFigureIncorrectExtensionWithNoExtension [

	| doc validator |
	doc := PRPillarParserMain parse: '
+A pic descripton.>file://validator_figures/aFileWithNoExtension+
'.
	validator := PRValidatorVisitor new.
	validator start: doc.
	self assert: validator isFailure.
	self assert: validator allTestsResults first explanation equals: (self allValidatorResults at: #figureIncorrectExtension).
	self assert: validator allTestsResults first specification equals: 'file://validator_figures/aFileWithNoExtension'
	
]

{ #category : #'test-figure' }
PRValidatorVisitorTest >> testErrorFigureNotFound [
	| doc validator |
	doc := PRPillarParserMain parse: '
+Use Custom SSH keys settings.>file://validator_figures/unfoundPic.png|width=75+
'.
	validator := PRValidatorVisitor new.
	validator start: doc.
	self assert: validator isFailure.
	self assert: validator allTestsResults first explanation equals: (self allValidatorResults at: #figureNotFound).
	self assert: validator allTestsResults first specification equals: 'file://validator_figures/unfoundPic.png'
]

{ #category : #'test-inputFileAnnotation' }
PRValidatorVisitorTest >> testErrorInputFileNotFound [
	| doc validator |
	doc := PRPillarParserMain parse: '
${inputFile:validator_unfound_input_file.pillar}$
'.
	validator := PRValidatorVisitor new.
	validator start: doc.
	self assert: validator isFailure.
	self assert: validator allTestsResults first explanation equals: (self allValidatorResults at: #inputFileNotFound).
	self assert: validator allTestsResults first specification equals: 'validator_unfound_input_file.pillar'
]

{ #category : #'test-anchor-reference' }
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
	self assert: validator allTestsResults first explanation equals: (self allValidatorResults at: #twoAnchorsSameName).
	self assert: validator allTestsResults first specification equals: 'secheader1'
	
]

{ #category : #'test-anchor-reference' }
PRValidatorVisitorTest >> testErrorTwoAnchorsSameNameRelativeToFigure [

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
	self assert: validator allTestsResults first explanation equals: (self allValidatorResults at: #twoAnchorsSameNameRelativeToFigure).
	self assert: validator allTestsResults first specification equals: 'UseCustom'
]

{ #category : #'test-figure' }
PRValidatorVisitorTest >> testFigureExists [
	| doc validator |
	doc := PRPillarParserMain
		parse:
			'
+A description.>file://validator_figures/useCustom.png|width=75|label=UseCustom+
'.
	validator := PRValidatorVisitor new.
	validator start: doc.
	self assert: validator isSuccess.
	self denyEmpty: validator anchors
]

{ #category : #'test-anchor-reference' }
PRValidatorVisitorTest >> testIdentifiesAnchor [
	| doc validator |
	doc := PRPillarParserMain
		parse:
			'
# Header1
@secheader1
	
A reference to header *@secheader1*
'.
	validator := PRValidatorVisitor new.
	validator start: doc.
	self assert: validator isSuccess.
	self denyEmpty: validator anchors
]

{ #category : #'test-figure' }
PRValidatorVisitorTest >> testIdentifiesFigureWithLabel [
	| doc validator |
	doc := PRPillarParserMain
		parse:
			'
+Use Custom SSH keys settings.>file://validator_figures/useCustom.png|width=75|label=UseCustom+
'.
	validator := PRValidatorVisitor new.
	validator start: doc.
	self assert: validator isSuccess.
	self denyEmpty: validator anchors
]

{ #category : #'test-figure' }
PRValidatorVisitorTest >> testIdentifiesFigureWithoutLabel [
	| doc validator |
	doc := PRPillarParserMain
		parse:
			'
+Use Custom SSH keys settings.>file://validator_figures/useCustom.png|width=75+
'.
	validator := PRValidatorVisitor new.
	validator start: doc.
	self assert: validator isSuccess.
	self assertEmpty: validator anchors
]

{ #category : #'test-inputFileAnnotation' }
PRValidatorVisitorTest >> testIdentifiesFileInclusion [
	| doc validator |
	doc := PRPillarParserMain parse: '
${inputFile:validator_inputFiles/my_test_file.pillar}$
'.
	validator := PRValidatorVisitor new.
	validator start: doc.
	self assert: validator isSuccess.
]

{ #category : #'test-anchor-reference' }
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

{ #category : #'test-anchor-reference' }
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

{ #category : #'test-anchor-reference' }
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
