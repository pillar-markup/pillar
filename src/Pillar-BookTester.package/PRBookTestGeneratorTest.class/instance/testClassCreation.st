running
testClassCreation

	| testGenerator |
	testGenerator := PRBookTestGenerator new.
	testGenerator workingDirectory: testingFileSystem.
	testGenerator checkAndReportFileNamed: self class pillarFileNameForTest.
	self assert: ('Pillar-BookTesterResults' asPackage includesClassNamed: #PRTTest)