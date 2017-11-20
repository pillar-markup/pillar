tests
testGenericTaskDependencyIsReExecutedIfInvalidated

	| executed dependencyExecuted dependency mainTask |
	executed := false.
	dependencyExecuted := 0.
	
	dependency := PRGenericTask doing: [ 
		dependencyExecuted := dependencyExecuted + 1 ].
	
	mainTask := (PRGenericTask doing: [ 
		executed := true ])
			addDependency: dependency.
	
	mainTask execute.
	dependency isAlreadyDone: false.
	mainTask execute.
	
	self assert: dependencyExecuted equals: 2