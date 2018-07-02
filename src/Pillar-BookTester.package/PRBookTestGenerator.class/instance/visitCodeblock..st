visiting
visitCodeblock: aCodeblock

	(aCodeblock isEvaluated)
		ifTrue: (super visitCodeblock: aCodeblock)
		ifFalse: (([ aCodeblock isTestcase ])
							ifTrue: [ self cbIndex: cbIndex+1.
				 			 self createTestMethodFrom: aCodeblock]).