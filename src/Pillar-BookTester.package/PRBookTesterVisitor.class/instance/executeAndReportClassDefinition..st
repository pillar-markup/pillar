compiling
executeAndReportClassDefinition: result
	"Executes a codeblock with parameter classDefinition=true.
	It verifies the compilation occurs without raising any Error/Exception
	[[[classDefinition
	Object subclass: #Plop
		instanceVariableNames: 'iv1 iv2'
		classVariableNames: ''
		package: 'Pillar-BookTesterResults'
	]]]"
	
	| isCorrect |
	result explanation: 'Class did not compile without raising an exception'.
	isCorrect := false.
	[ isCorrect := (self class compiler evaluate: result text)]
		on: Exception
		do: [ :ex | result explanation: ex asString ].
	result status: isCorrect.
	isCorrect
		ifTrue: [ result explanation: 'Class created' ]
	
	
		
