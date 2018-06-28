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
	[ self class evaluate: result text.
	  isCorrect := true ]
		on: Exception
		do: [ :ex | result explanation: ex asString.
						isCorrect := false ].
	isCorrect
		ifTrue: [ result explanation: 'Class created' ]
	
	
		
