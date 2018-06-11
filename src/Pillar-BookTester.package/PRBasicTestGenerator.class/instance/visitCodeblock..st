visiting
visitCodeblock: aCodeBlock

(checkAll or: [ aCodeBlock hasTestable ])
		ifTrue: [ 
			| result |
			result := PRBookTestResult new.
			result text: aCodeBlock text.
			allTestResults add: result. 
			self executeAndReport: result.
			]