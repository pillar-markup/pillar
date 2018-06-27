visiting
visitCodeblockTestDefinition: aCodeBlock
	
	| result |
	result := PRBookTestResult new.
	result text: aCodeBlock textForTests.
	allTestResults add: result.
	self executeAndReportTestDefinition: result 