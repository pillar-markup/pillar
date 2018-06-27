visiting
visitCodeblockMethodDefinition: aCodeBlock
	
	| result |
	"To do: add a formating method using the first line to obtain class name and method name"
	result := PRBookTestResult new.
	result text: aCodeBlock textForMethodDefinitionParameter.
	allTestResults add: result.
	self executeAndReportMethodDefinition: result 