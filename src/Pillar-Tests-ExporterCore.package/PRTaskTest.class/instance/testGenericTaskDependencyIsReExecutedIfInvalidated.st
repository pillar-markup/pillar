tests
testGenericTaskDependencyIsReExecutedIfInvalidated

	| executed dependencyExecuted dependency mainTask |
	executed := false.
	dependencyExecuted := 0.
	
	dependency := PRGenericObjectTask onBlock: [ 
		dependencyExecuted := dependencyExecuted + 1 ].
	
	mainTask := (PRGenericObjectTask onBlock: [ 
		executed := true ])
			addDependency: dependency.
	
	mainTask execute.
	dependency invalidate.
	mainTask execute.
	
	self assert: dependencyExecuted equals: 2