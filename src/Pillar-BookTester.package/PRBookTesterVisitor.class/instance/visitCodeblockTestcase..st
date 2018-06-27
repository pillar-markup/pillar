visiting
visitCodeblockTestcase: aCodeBlock
	
	| result |
	result := PRBookTestResult new.
	result text: aCodeBlock textForTestcaseParameter.
	allTestResults add: result.
	self executeAndReport: result 