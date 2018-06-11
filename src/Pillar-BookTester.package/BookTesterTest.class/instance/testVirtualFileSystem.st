tests
testVirtualFileSystem

	| bTester |
	bTester := PRBookTesterVisitor new.
	bTester workingDirectory: testingFileSystem.
	bTester checkAndReportFileNamed: self class pillarFileNameForTest.
	self assert: bTester failedTests size equals: 4.
	self assert: bTester validTests size equals: 2.