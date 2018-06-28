testing
failedTests
	"Returns the failed tests within the test results"
	^ allTestResults select: [ :each | each isFailed ]