visiting
visitCodeblock: aCodeBlock
	| result |
	(checkAll or: [ aCodeBlock hasTestable ])
		ifFalse: [ ^ self ].
	result := PRBookTestResult new.
	result text: aCodeBlock text.
	allTestResults add: result.
	self executeAndReport: result