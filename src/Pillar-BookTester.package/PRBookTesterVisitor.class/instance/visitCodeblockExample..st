visiting-codeblock
visitCodeblockExample: aCodeBlock
	"Creates an instance of PRBookTestResult with parameters depending of the type of the codeblock. 
	Here it is for an example and therefore uses the specialized exmple methods
	textForTestcase
	executeAndReportExample:
	Note that there is no fragmentedText here, no need for it b/ecause the codeblock text contains the whole text
	and is the equivalent of  Playground execution"
	| result |
	result := PRBookTestResult new.
	result text: aCodeBlock textForExample.
	allTestResults add: result.
	self executeAndReportExample: result 