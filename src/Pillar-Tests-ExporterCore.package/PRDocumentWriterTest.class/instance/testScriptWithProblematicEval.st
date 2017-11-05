tests
testScriptWithProblematicEval
	| item nonExistingMethod |
	nonExistingMethod := 'FooBarDoesNotExistX'.
	item := (PRScript content: 'Object ' , nonExistingMethod)
		eval: true;
		yourself.
	self assert: item isEvaluated.
	self assertWriting: item includesText: nonExistingMethod