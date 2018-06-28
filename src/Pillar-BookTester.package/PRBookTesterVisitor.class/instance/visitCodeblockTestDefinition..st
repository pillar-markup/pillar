visiting
visitCodeblockTestDefinition: aCodeBlock
	"Creates an instance of PRBookTestResult with parameters depending of the type of the codeblock. 
	Here it is for a test definition and therefore uses the specialized test definition methods
	textForTestDefinitionParameter
	executeAndReportTestDefinition:"
	| result |
	result := PRBookTestResult new.
	result text: aCodeBlock text.
	result fragmentedText: aCodeBlock textForTestDefinitionParameter.
	allTestResults add: result.
	self executeAndReportTestDefinition: result 