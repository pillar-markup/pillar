test - virtual file
testEverythingVirtualFileSystem

	| bTester |
	bTester := PRBookTesterVisitor new.
	bTester workingDirectory: testingFileSystem.
	bTester reportAllCodeBlocks.
	bTester checkAndReportFileNamed: self class pillarFileNameForTest.
	self halt.
	self assert: bTester failedTests size equals: 6.
	self assert: bTester validTests size equals: 3.