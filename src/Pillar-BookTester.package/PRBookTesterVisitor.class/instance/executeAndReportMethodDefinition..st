visiting
executeAndReportMethodDefinition: result
	| isCorrect |
	
	result explanation: 'Method did not compile without raising an exception'.
	isCorrect := false.
	[ isCorrect := self class compiler evaluate: result text ]
		on: Exception
		do: [ :ex | result explanation: ex asString ].
	result status: isCorrect.
	isCorrect
		ifTrue: [ result explanation: 'Method compiled' ]
	
	
		
