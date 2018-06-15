visiting
visitCodeblock: aCodeBlock
	| test association |
	association := aCodeBlock text evaluate.
	(checkAll or: [ aCodeBlock hasTestcase ])
		ifTrue: [ test := PRBookTestTemplate generateWithText: association key
					 									 andResult: association result.
					 allTestResults add: test ].