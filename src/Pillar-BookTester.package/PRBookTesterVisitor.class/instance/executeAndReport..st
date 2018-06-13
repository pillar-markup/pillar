visiting
executeAndReport: result
	| isCorrect |
	isCorrect := false.
	[ isCorrect := (self class compiler evaluate: result text) isPaired ]
		on: Error
		do: [ :ex | result explanation: ex ].
	result status: isCorrect.
	isCorrect
		ifTrue: [ result explanation: 'Test passed' ]
	
	
		
