tests - explanation
testEvaluateClassCreation
	
	|  bTester |
	bTester := PRBookTesterVisitor new.
	bTester workingDirectory: testingFileSystem.
	bTester checkAndReportFileNamed: self class pillarFileNameForTest.
	self assert: (TestCase subclasses includes: PRBookTesterTestResults)
	