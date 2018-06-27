visiting
executeAndReportTestDefinition: result
	| isCorrect |
	result explanation: 'Test compilation failed'.
	isCorrect := false.
	[ isCorrect := result text first compile: result text second,'
	', result text third ]
		on: Exception
		do: [ :ex | result explanation: ex asString ].
	result status: isCorrect.
	isCorrect
		ifTrue: [ result explanation: 'Test compiled and green' ]
	
	