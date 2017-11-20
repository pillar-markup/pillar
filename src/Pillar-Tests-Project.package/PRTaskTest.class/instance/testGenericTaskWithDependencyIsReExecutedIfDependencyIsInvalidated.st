tests
testGenericTaskWithDependencyIsReExecutedIfDependencyIsInvalidated

	| executed dependencyExecuted dependency mainTask |
	executed := 0.
	dependencyExecuted := false.
	
	dependency := PRGenericTask doing: [ 
		dependencyExecuted := true ].
	
	mainTask := (PRGenericTask doing: [
		executed := executed + 1 ])
			addDependency: dependency.
	
	mainTask execute.
	dependency isAlreadyDone: false.
	mainTask execute.

	self assert: executed equals: 2