"
Tests
"
Class {
	#name : #PRBookTestGeneratorTest,
	#superclass : #PRBookTestEnvironmentTest,
	#instVars : [
		'testingFileSystem'
	],
	#category : 'Pillar-BookTester-Visitor-Tests'
}

{ #category : #running }
PRBookTestGeneratorTest >> methodCreationFail [
	^ self class environment at: #PRTTestMethodCreationFail
]

{ #category : #running }
PRBookTestGeneratorTest >> methodCreationSuccess [
	^ self class environment at: #PRTTestMethodCreationSuccess
]

{ #category : #running }
PRBookTestGeneratorTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	
	super setUp.
	testingFileSystem := FileSystem memory workingDirectory.
	(testingFileSystem / self class pillarFileNameForTest)
		writeStreamDo: [ :stream |
			stream nextPutAll: self class pillarContentsForTest ].
	"[ 'Pillar-BookTesterResults-TestResults' asPackage removeFromSystem ] ifCurtailed: [ nil ]"

]

{ #category : #running }
PRBookTestGeneratorTest >> tearDown [
	
	| pak |
	super tearDown.
	pak := RPackageOrganizer default packageNamed: #'Pillar-BookTesterResults-TestResults' ifAbsent: [^ self ].
	pak removeFromSystem.


]

{ #category : #running }
PRBookTestGeneratorTest >> testMethodCreationFailingCodeblock [
	| testGenerator codeBlock |
	testGenerator := PRBookTestGenerator new.
	testGenerator resultPackage: 'Pillar-BookTesterResults-TestResults'.
	testGenerator fileName: 'PRTTestMethodCreationFail'.
	testGenerator createClassFrom: testGenerator fileName.
	testGenerator codeBlockIndex: 1.
	codeBlock := PRCodeblock
		content: '3+7>>>11'
		parameters: 'example=true'.
	testGenerator createTestMethodFrom: codeBlock.
	self assert: (self methodCreationFail methodDict includesKey: #test1).
	self
		assert: (self methodCreationFail methodDict at: #test1) sourceCode
		equals:
			'test1
	
	self assert: ((3+7)>>>11) isPaired'.
	self
		assert: self methodCreationFail suite run failures size
		equals: 1.
	self assert: self methodCreationFail suite run errors isEmpty.
	self assert: self methodCreationFail suite run passed isEmpty
]

{ #category : #running }
PRBookTestGeneratorTest >> testMethodCreationSuccessfulCodeblock [
	| testGenerator codeBlock |
	testGenerator := PRBookTestGenerator new.
	testGenerator resultPackage: 'Pillar-BookTesterResults-TestResults'.
	testGenerator fileName: 'PRTTestMethodCreationSuccess'.
	testGenerator createClassFrom: testGenerator fileName.
	testGenerator codeBlockIndex: 1.
	codeBlock := PRCodeblock
		content: '3+4>>>7'
		parameters: 'testcase=true'.
	testGenerator createTestMethodFrom: codeBlock.
	self assert: (self methodCreationSuccess methodDict includesKey: #test1).
	self
		assert: (self methodCreationSuccess methodDict at: #test1) sourceCode
		equals:
			'test1
	
	self assert: ((3+4)>>>7) isPaired'.
	self assert: self methodCreationSuccess suite run failures isEmpty.
	self assert: self methodCreationSuccess suite run errors isEmpty.
	self
		assert:
			self methodCreationSuccess suite run passed size
		equals: 1
]

{ #category : #running }
PRBookTestGeneratorTest >> testMethodCreationSyntaxErrorCodeblock [

	| testGenerator codeBlock |
	testGenerator := PRBookTestGenerator new.
	testGenerator fileName: 'PRTTestMethodCreationError'.
	testGenerator resultPackage: 'Pillar-BookTesterResults-TestResults'.
	testGenerator createClassFrom: testGenerator fileName.
	testGenerator codeBlockIndex: 1.
	codeBlock := PRCodeblock content: '(a1 at: 1) at: 1 put: ''sally''. a1 >>> #(#(''sally''))' parameters: 'testcase=true'.
	testGenerator createTestMethodFrom: codeBlock.
	self assert: ((self class environment at: #PRTTestMethodCreationError) methodDict includesKey: #test1).
	self assert: ((self class environment at: #PRTTestMethodCreationError) methodDict at: #test1) sourceCode equals: 'test1

	self assert: Error signal description: ''A code block failed''. 
	"SyntaxErrorNotification was raised with: '')'' expected"
	"by the codeblock: ((a1 at: 1) at: 1 put: ''sally''. a1)>>>#(#(''sally''))"'.
	self assert: (self class environment at: #PRTTestMethodCreationError) suite run failures isEmpty.
	self assert: (self class environment at: #PRTTestMethodCreationError) suite run errors size equals:1.
	self assert: (self class environment at: #PRTTestMethodCreationError) suite run passed isEmpty.
	
]

{ #category : #running }
PRBookTestGeneratorTest >> testMethodsPassed [

	| testGenerator |
	testGenerator := PRBookTestGenerator new.
	testGenerator resultPackage: 'Pillar-BookTesterResults-TestResults'.
	testGenerator workingDirectory: testingFileSystem.
	testGenerator checkAndReportFileNamed: self class pillarFileNameForTest.	
	self assert: testGenerator codeBlockIndex equals: 6.
	self assert: ((testGenerator resultPackage) asPackage definedMethodsForClass: (self class environment at: #PRTTest)) size equals: 6.
]

{ #category : #running }
PRBookTestGeneratorTest >> testPrettyRename [

	| testGenerator |
	testGenerator := PRBookTestGenerator new.
	self assert: (testGenerator prettyRename: '/usr/Users/Library/test.pillar') 
		  equals: 'PRTTest'.
]
