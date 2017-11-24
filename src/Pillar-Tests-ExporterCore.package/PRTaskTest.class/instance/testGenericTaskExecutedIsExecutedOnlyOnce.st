tests
testGenericTaskExecutedIsExecutedOnlyOnce

	| executed |
	executed := 0.
	(PRGenericObjectTask onBlock:[ executed := executed + 1 ])
		execute;
		execute;
		execute;
		execute.
	
	self assert: executed equals: 1