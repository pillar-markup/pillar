visiting
visitCodeblock2: aCodeBlock
	
	| result |
	(aCodeBlock isEvaluated)
		ifTrue: (super visitCodeblock: aCodeBlock)
		ifFalse: ( (checkAll or: [ aCodeBlock isTestcase ])
							ifTrue: [ result := PRBookTestResult new.
								 result text: aCodeBlock textForTestcase.
								 allTestResults add: result.
								 self executeAndReportTestCase: result ]).
	
	"possibleCodeblocks keys do: [ :any | (aCodeBlock any)
														ifTrue: [ (self possibleCodeblocks at: any) aCodeBlock ] ]"