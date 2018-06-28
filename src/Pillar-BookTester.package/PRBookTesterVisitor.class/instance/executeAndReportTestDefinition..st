compiling
executeAndReportTestDefinition: result
	| isCorrect |
	"Executes the method definition in the given class with the right name and runs the test
	[[[methodDefinition
	TestPlop >> testplop1
	self assert: Plop new plop1 equals: 1
	]]]
	will define the method testplop1 that tests plop1 in the class TestPlop"
	"Todo: assert test passed"
	result explanation: 'Test compilation failed'.
	isCorrect := false.
	[ isCorrect := result text first compile: result text second,'
	', result text third ]
		on: Exception
		do: [ :ex | result explanation: ex asString ].
	result status: isCorrect.
	isCorrect
		ifTrue: [ result explanation: 'Test compiled and green' ]
	
	