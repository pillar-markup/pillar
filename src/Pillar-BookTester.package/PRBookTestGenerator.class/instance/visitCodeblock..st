visiting
visitCodeblock: aCodeblock

	(aCodeblock isEvaluated)
		ifTrue: (self evaluate: aCodeblock)
		ifFalse:[(aCodeblock isExample)
							ifTrue: [ self cbIndex: cbIndex+1.
				 			 self createTestMethodFrom: aCodeblock]]