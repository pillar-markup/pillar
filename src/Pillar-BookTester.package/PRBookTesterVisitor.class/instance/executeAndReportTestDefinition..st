visiting
executeAndReportTestDefinition: result
	| isCorrect |
	"To do: properly define the test making"
	result explanation: 'Test compilation failed'.
	isCorrect := false.
	[ isCorrect := self class compiler evaluate: result text ]
		on: Exception
		do: [ :ex | result explanation: ex asString ].
	result status: isCorrect.
	isCorrect
		ifTrue: [ result explanation: 'Test compiled and green' ]
	
	
		
