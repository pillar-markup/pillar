visiting
visitCodeblockTestDefinition: aCodeBlock
	"Creates an instance of PRBookTestResult with parameters depending of the type of the codeblock. 
	Here it is for a test definition and therefore uses the specialized test definition methods
	textForMethodDefinition (same behavior, only the testing part will differ)
	executeAndReportTestDefinition:"
	| result |
	result := PRBookTestResult new.
	result text: aCodeBlock text.
	result fragmentedText: aCodeBlock textForMethodDefinition.
	allTestResults add: result.
	self executeAndReportTestDefinition: result 