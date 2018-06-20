visiting
visitCodeblock: aCodeblock

	(checkAll or: [ aCodeblock hasTestcase ])
		ifTrue: [ self cbIndex: cbIndex+1.
				 	 self createTestMethodFrom: aCodeblock].