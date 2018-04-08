tests
testScriptWithProblematicEval
	| item nonExistingMethod |
	nonExistingMethod := 'FooBarDoesNotExistX'.
	item := (PRCodeblock content: 'Object ' , nonExistingMethod)
		eval: true;
		yourself.
	self assert: item isEvaluated.
	self assertWriting: item includesText: nonExistingMethod