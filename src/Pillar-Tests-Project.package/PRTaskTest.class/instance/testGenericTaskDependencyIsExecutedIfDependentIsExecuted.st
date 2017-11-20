tests
testGenericTaskDependencyIsExecutedIfDependentIsExecuted

	| executed dependencyExecuted dependency mainTask |
	executed := false.
	dependencyExecuted := false.
	
	dependency := PRGenericTask doing: [ 
		dependencyExecuted := true ].
	
	mainTask := (PRGenericTask doing: [ 
		executed := true ])
			addDependency: dependency.
	
	mainTask
		execute;
		execute;
		execute;
		execute.
	
	self assert: dependencyExecuted