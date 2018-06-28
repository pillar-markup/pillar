compiling
executeAndReportMethodDefinition: result
	| isCorrect |
	"Executes the method definition in the given class with the right name
	[[[methodDefinition
	Plop >> plop1
	^1
	]]]
	will define the method plop1 that returns 1 in the class Plop"
	
	result explanation: 'Method did not compile without raising an exception'.
	isCorrect := false.
	[ (self class environment at: (result fragmentedText first) asSymbol) compile: (result fragmentedText second,'
	', result fragmentedText third).
	  isCorrect := true ]
		on: Exception
		do: [ :ex | result explanation: ex asString ].
	isCorrect
		ifTrue: [ result explanation: 'Method compiled' ]
	
	
		
