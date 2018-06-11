testing
failedTests
	^ allTestResults select: [ :each | each isFailed ]