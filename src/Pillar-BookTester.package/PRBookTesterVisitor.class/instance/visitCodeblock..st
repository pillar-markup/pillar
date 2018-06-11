visiting
visitCodeblock: aCodeBlock
	| result |
	(checkAll or: [ aCodeBlock hasTestable ])
		ifTrue: [ result := PRBookTestResult new.
					 result text: aCodeBlock text.
					 allTestResults add: result.
					 self executeAndReport: result ].