visiting
visitCodeblockMethodDefinition: aCodeBlock
	
	| result |
	result := PRBookTestResult new.
	result text: aCodeBlock textForMethodDefinitionParameter.
	allTestResults add: result.
	self executeAndReportMethodDefinition: result 