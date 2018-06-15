visiting
visitCodeblock: aCodeblock

	(checkAll or: [ aCodeblock hasTestcase ])
		ifTrue: [ self createTestMethodFrom: aCodeblock ].