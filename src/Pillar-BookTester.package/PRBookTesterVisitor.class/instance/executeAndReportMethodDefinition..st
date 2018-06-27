visiting
executeAndReportMethodDefinition: result
	| isCorrect |
	
	result explanation: 'Method did not compile without raising an exception'.
	isCorrect := false.
	[ isCorrect := result text first compile: result text second,'
	', result text third ]
		on: Exception
		do: [ :ex | result explanation: ex asString ].
	result status: isCorrect.
	isCorrect
		ifTrue: [ result explanation: 'Method compiled' ]
	
	
		
