tests
testGenericTaskDependencyIsExecutedIfDependentIsExecuted

	| executed dependencyExecuted dependency mainTask |
	executed := false.
	dependencyExecuted := false.
	
	dependency := PRGenericObjectTask onBlock: [ 
		dependencyExecuted := true ].
	
	mainTask := (PRGenericObjectTask onBlock: [ 
		executed := true ])
			addDependency: dependency.
	
	mainTask
		execute;
		execute;
		execute;
		execute.
	
	self assert: dependencyExecuted