visiting-codeblock
visitCodeblockTestcase: aCodeBlock
	"Creates an instance of PRBookTestResult with parameters depending of the type of the codeblock. 
	Here it is for a test definition and therefore uses the specialized test definition methods
	textForTestcase
	executeAndReportTestCase:
	Note that there is no fragmentedText here, no need for it because the codeblock text contains the whole text
	and is the equivalent of  Playground execution"
	| result |
	result := PRBookTestResult new.
	result text: aCodeBlock textForTestcase.
	allTestResults add: result.
	self executeAndReportTestCase: result 