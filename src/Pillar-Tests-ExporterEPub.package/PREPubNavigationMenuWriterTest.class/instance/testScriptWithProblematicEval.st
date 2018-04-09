tests
testScriptWithProblematicEval
	| item nonExistingMethod |
	nonExistingMethod := 'FooBarDoesNotExistX'.
	item := (PRCodeblock content: 'Object ' , nonExistingMethod)
		eval: true;
		yourself.
	self assert: (self write: item) isEmpty