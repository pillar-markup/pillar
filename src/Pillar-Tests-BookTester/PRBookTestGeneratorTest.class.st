"
Tests
"
Class {
	#name : #PRBookTestGeneratorTest,
	#superclass : #PRBookTestEnvironmentTest,
	#instVars : [
		'testingFileSystem',
		'testGenerator'
	],
	#category : #'Pillar-Tests-BookTester'
}

{ #category : #running }
PRBookTestGeneratorTest >> methodCreationError [
	^ self class environment at: #PRTTestMethodCreationError
]

{ #category : #running }
PRBookTestGeneratorTest >> methodCreationFail [
	^ self class environment at: #PRTTestMethodCreationFail
]

{ #category : #running }
PRBookTestGeneratorTest >> methodCreationSuccess [
	^ self class environment at: #PRTTestMethodCreationSuccess
]

{ #category : #running }
PRBookTestGeneratorTest >> packageName [ 

	^ #'Pillar-BookTesterResults-TestResults'
]

{ #category : #running }
PRBookTestGeneratorTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	
	super setUp.
	testGenerator := PRBookTestGenerator new.
	testingFileSystem := FileSystem memory workingDirectory.
	(testingFileSystem / self class pillarFileNameForTest)
		writeStreamDo: [ :stream |
			stream nextPutAll: self class pillarContentsForTest ].
	"[ 'Pillar-BookTesterResults-TestResults' asPackage removeFromSystem ] ifCurtailed: [ nil ]"

]

{ #category : #running }
PRBookTestGeneratorTest >> tearDown [
	| pak |
	pak := RPackageOrganizer default packageNamed: self packageName ifAbsent: [ ^ self ].
	pak removeFromSystem.
	super tearDown
]

{ #category : #running }
PRBookTestGeneratorTest >> testMethodCreationFailingCodeblock [
	| codeBlock run |
	testGenerator resultPackage: self packageName.
	testGenerator fileName: 'PRTTestMethodCreationFail'.
	testGenerator createClassFrom: testGenerator fileName.
	testGenerator codeBlockIndex: 1.
	codeBlock := PRCodeblock content: '3+7>>>11' parameters: 'example=true'.
	testGenerator createTestMethodFrom: codeBlock.
	self assert: (self methodCreationFail methodDict includesKey: #test1).
	self
		assert: (self methodCreationFail methodDict at: #test1) sourceCode
		equals:
			'test1
	
	self assert: ((3+7)>>>11) isPaired'.
	run := self methodCreationFail suite run.
	self assert: run failures size equals: 1.
	self assertEmpty: run errors.
	self assertEmpty: run passed
]

{ #category : #running }
PRBookTestGeneratorTest >> testMethodCreationSuccessfulCodeblock [
	| codeBlock run |
	testGenerator resultPackage: self packageName.
	testGenerator fileName: 'PRTTestMethodCreationSuccess'.
	testGenerator createClassFrom: testGenerator fileName.
	testGenerator codeBlockIndex: 1.
	codeBlock := PRCodeblock content: '3+4>>>7' parameters: 'testcase=true'.
	testGenerator createTestMethodFrom: codeBlock.
	self assert: (self methodCreationSuccess methodDict includesKey: #test1).
	self
		assert: (self methodCreationSuccess methodDict at: #test1) sourceCode
		equals:
			'test1
	
	self assert: ((3+4)>>>7) isPaired'.
	run := self methodCreationSuccess suite run.
	self assertEmpty: run failures.
	self assertEmpty: run errors.
	self assert: run passed size equals: 1
]

{ #category : #running }
PRBookTestGeneratorTest >> testMethodCreationSyntaxErrorCodeblock [
	| codeBlock run |
	testGenerator fileName: 'PRTTestMethodCreationError'.
	testGenerator resultPackage: self packageName.
	testGenerator createClassFrom: testGenerator fileName.
	testGenerator codeBlockIndex: 1.
	codeBlock := PRCodeblock content: '(a1 at: 1) at: 1 put: ''sally''. a1 >>> #(#(''sally''))' parameters: 'testcase=true'.
	testGenerator createTestMethodFrom: codeBlock.
	self assert: (self methodCreationError methodDict includesKey: #test1).
	self
		assert: (self methodCreationError methodDict at: #test1) sourceCode
		equals:
			'test1

	self assert: Error signal description: ''A code block failed''. 
	"SyntaxErrorNotification was raised with: '')'' expected"
	"by the codeblock: ((a1 at: 1) at: 1 put: ''sally''. a1)>>>#(#(''sally''))"'.
	run := self methodCreationError suite run.
	self assertEmpty: run failures.
	self assert: run errors size equals: 1.
	self assertEmpty: run passed
]

{ #category : #running }
PRBookTestGeneratorTest >> testMethodsPassed [

	testGenerator resultPackage: self packageName.
	testGenerator workingDirectory: testingFileSystem.
	testGenerator checkAndReportFileNamed: self class pillarFileNameForTest.	
	self assert: testGenerator codeBlockIndex equals: 6.
	self 
		assert: (testGenerator resultPackage asPackage definedMethodsForClass: (self class environment at: #PRTTest)) size 
		equals: 6.
]

{ #category : #running }
PRBookTestGeneratorTest >> testPrettyRename [

	self assert: (testGenerator prettyRename: '/usr/Users/Library/test.pillar') 
		  equals: 'PRTTest'.
]
