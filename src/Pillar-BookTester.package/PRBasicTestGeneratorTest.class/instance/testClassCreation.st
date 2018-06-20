running
testClassCreation

	| testGenerator |
	testGenerator := PRBasicTestGenerator new.
	testGenerator workingDirectory: testingFileSystem.
	testGenerator checkAndReportFileNamed: self class pillarFileNameForTest.
	self assert: ('Pillar-BookTesterResults' asPackage includesClassNamed: #Test)