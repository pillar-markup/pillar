compiling
executeAndReportTestCase: result
	"Executes a codeblock with parameter testcase=true.
	To determine whether or not the test passed, this method creates an association as follows:
	[[[testcase
	3+4
	>>>7
	]]]
	is tested: 
	((3+4)>>>7) isPaired"
	
	| isCorrect |
	isCorrect := false.
	[ isCorrect := (self class compiler evaluate: result text) isPaired ]
		on: Exception
		do: [ :ex | result explanation: ex asString ].
	result status: isCorrect.
	isCorrect
		ifTrue: [ result explanation: 'Test passed' ]
	
	
		
