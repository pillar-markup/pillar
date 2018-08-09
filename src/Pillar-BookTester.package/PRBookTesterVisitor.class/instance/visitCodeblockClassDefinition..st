visiting-codeblock
visitCodeblockClassDefinition: aCodeBlock
	"Creates an instance of PRBookTestResult with parameters depending of the type of the codeblock. 
	Here it is for a class definition, it simply compiles the codeblock text"
	| result |
	result := PRBookTestResult new.
	result text: aCodeBlock text.
	allTestResults add: result.
	self executeAndReportClassDefinition: result.
	(aCodeBlock isExpectedFailure)
		ifTrue: [ result status: (result status) not]
	