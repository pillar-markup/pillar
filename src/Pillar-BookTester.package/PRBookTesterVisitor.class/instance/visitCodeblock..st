visiting
visitCodeblock: aCodeBlock
	| result |
	(checkAll or: [ aCodeBlock hasTestcase ])
		ifTrue: [ result := PRBookTestResult new.
					 result text: aCodeBlock textForTests.
					 allTestResults add: result.
					 self executeAndReport: result ].