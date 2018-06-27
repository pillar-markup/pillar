visiting
visitCodeblock: aCodeBlock
	
	| result |
	"To do: Specialize the visit to redirect towards specified visits"
	(aCodeBlock isEvaluated)
		ifTrue: (super visitCodeblock: aCodeBlock)
		ifFalse: ( (checkAll or: [ aCodeBlock isTestcase ])
							ifTrue: [ result := PRBookTestResult new.
								 result text: aCodeBlock textForTestcaseParameter.
								 allTestResults add: result.
								 self executeAndReport: result ]).