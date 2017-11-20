tests
testGenericTaskExecutedIsExecutedFirstTime

	| executed |
	executed := false.
	(PRGenericTask doing: [ executed := true ]) execute.
	
	self assert: executed