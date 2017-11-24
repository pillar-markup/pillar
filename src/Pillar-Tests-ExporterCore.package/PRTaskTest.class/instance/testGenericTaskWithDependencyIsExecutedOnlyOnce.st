tests
testGenericTaskWithDependencyIsExecutedOnlyOnce

	| executed dependencyExecuted dependency mainTask |
	executed := 0.
	dependencyExecuted := false.
	
	dependency := PRGenericObjectTask onBlock: [ 
		dependencyExecuted := true ].
	
	mainTask := (PRGenericObjectTask onBlock: [ 
		executed := executed + 1 ])
			addDependency: dependency.
	
	mainTask
		execute;
		execute;
		execute;
		execute.
	
	self assert: executed equals: 1