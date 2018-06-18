running
testEverythingClassCreation

	| testGenerator |
	testGenerator := PRBasicTestGenerator new.
	testGenerator workingDirectory: testingFileSystem.
	testGenerator reportAllCodeBlocks.
	testGenerator checkAndReportFileNamed: self class pillarFileNameForTest.
	self assert: 'Pillar-BookTesterResults' asPackage exists.
	self assert: ('Pillar-BookTesterResults' asPackage includesClassNamed: #Test)