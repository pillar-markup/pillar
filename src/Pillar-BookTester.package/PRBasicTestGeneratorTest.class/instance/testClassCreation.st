running
testClassCreation

	| bTester |
	bTester := PRBasicTestGenerator new.
	bTester workingDirectory: testingFileSystem.
	bTester checkAndReportFileNamed: self class pillarFileNameForTest.
	self assert: 'Pillar-BookTesterResults' asPackage exists.
	self assert: (self class environment at: #Test) exists