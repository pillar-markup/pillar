tests
testGenericTaskDoneOutsideIsNotExecuted

	| executed |
	executed := 0.
	(PRGenericTask doing: [ executed := executed + 1 ])
		isAlreadyDone: true;
		execute;
		execute;
		execute;
		execute.
	
	self assert: executed equals: 0