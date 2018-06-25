tests - explanation
testEvaluateClassCreation
	
	|  bTester |
	bTester := PRBookTesterVisitor new.
	bTester workingDirectory: testingFileSystem.
	bTester checkAndReportFileNamed: self class pillarFileNameForTest.
	self assert: (PRBookTesterTest subclasses includes: PRBookTesterTestResults)
	