tests
testGenericTaskExecutedIsExecutedFirstTime

	| executed |
	executed := false.
	(PRGenericObjectTask onBlock: [ executed := true ]) execute.
	
	self assert: executed