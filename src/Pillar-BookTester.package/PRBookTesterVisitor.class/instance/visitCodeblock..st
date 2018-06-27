visiting
visitCodeblock: aCodeBlock
	
	| result |
		
	(aCodeBlock isEvaluated)
		ifTrue: (super visitCodeblock: aCodeBlock)
		ifFalse: ( (checkAll or: [ aCodeBlock isTestcase ])
							ifTrue: [ result := PRBookTestResult new.
								 result text: aCodeBlock textForTests.
								 allTestResults add: result.
								 self executeAndReport: result ]).