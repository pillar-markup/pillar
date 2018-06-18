running
testEverythingMethodsPassed

	| testGenerator |
	testGenerator := PRBasicTestGenerator new.
	testGenerator workingDirectory: testingFileSystem.
	testGenerator reportAllCodeBlocks.
	testGenerator checkAndReportFileNamed: self class pillarFileNameForTest.	
	self assert: testGenerator cbIndex equals: 9.
	self assert: ('Pillar-BookTesterResults' asPackage definedMethodsForClass: #Test) size equals: 9.