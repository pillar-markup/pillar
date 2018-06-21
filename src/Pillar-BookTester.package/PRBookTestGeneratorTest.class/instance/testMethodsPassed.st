running
testMethodsPassed

	| testGenerator |
	testGenerator := PRBookTestGenerator new.
	testGenerator workingDirectory: testingFileSystem.
	testGenerator checkAndReportFileNamed: self class pillarFileNameForTest.	
	self assert: testGenerator cbIndex equals: 6.
	self assert: ('Pillar-BookTesterResults' asPackage definedMethodsForClass: Test) size equals: 6.