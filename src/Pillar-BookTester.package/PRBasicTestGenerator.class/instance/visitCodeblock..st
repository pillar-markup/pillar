visiting
visitCodeblock: aCodeBlock
	| test association |
	association := aCodeBlock text evaluate.
	(checkAll or: [ aCodeBlock hasTestable ])
		ifTrue: [ test := PRBookTestTemplate generateWithText: association key
					 									 andResult: association result.
					 allTestResults add: test ].