running
testClassCreation

	| bTester |
	bTester := PRBasicTestGenerator new.
	bTester workingDirectory: testingFileSystem.
	bTester checkAndReportFileNamed: self class pillarFileNameForTest.
	self assert: 'Pillar-BookTesterResult' asPackage exists.
	self assert: 'test.pillar' asClass exists