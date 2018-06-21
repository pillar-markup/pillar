visiting
executeAndReport: result
	| isCorrect |
	isCorrect := false.
	[ isCorrect := (self class compiler evaluate: result text) isPaired ]
		on: Exception
		do: [ :ex | result explanation: ex asString ].
	result status: isCorrect.
	isCorrect
		ifTrue: [ result explanation: 'Test passed' ]
	
	
		
