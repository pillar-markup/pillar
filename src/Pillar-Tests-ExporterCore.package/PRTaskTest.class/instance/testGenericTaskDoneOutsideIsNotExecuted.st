tests
testGenericTaskDoneOutsideIsNotExecuted

	| executed |
	executed := 0.
	(PRGenericObjectTask onBlock: [ executed := executed + 1 ])
		result: 0;
		execute;
		execute;
		execute;
		execute.
	
	self assert: executed equals: 0