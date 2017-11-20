tests
testGenericTaskExecutedIsExecutedOnlyOnce

	| executed |
	executed := 0.
	(PRGenericTask doing: [ executed := executed + 1 ])
		execute;
		execute;
		execute;
		execute.
	
	self assert: executed equals: 1