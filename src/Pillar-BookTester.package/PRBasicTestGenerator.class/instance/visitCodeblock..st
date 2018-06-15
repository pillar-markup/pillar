visiting
visitCodeblock: aCodeblock

	(checkAll or: [ aCodeblock hasTestcase ])
		ifTrue: [ self createTestMethodFrom: aCodeblock.
				    self cbIndex: cbIndex+1].