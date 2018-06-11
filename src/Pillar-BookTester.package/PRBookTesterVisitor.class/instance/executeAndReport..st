visiting
executeAndReport: result
	| isCorrect |
	isCorrect := false.
	[ isCorrect := (Compiler evaluate: result text) isOk ]
		on: Error
		do: [ :ex | ].
	result status: isCorrect.
		
