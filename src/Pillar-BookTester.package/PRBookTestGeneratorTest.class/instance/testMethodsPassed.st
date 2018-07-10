running
testMethodsPassed

	| testGenerator |
	testGenerator := PRBookTestGenerator new.
	testGenerator resultPackage: 'Pillar-BookTesterResults-TestResults'.
	testGenerator workingDirectory: testingFileSystem.
	testGenerator checkAndReportFileNamed: self class pillarFileNameForTest.	
	self assert: testGenerator cbIndex equals: 6.
	self assert: ((testGenerator resultPackage) asPackage definedMethodsForClass: PRTTest) size equals: 6.