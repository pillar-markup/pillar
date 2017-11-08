preparation
prepareForExecutionOn: aPRProject 

	| configuration |
	configuration := (PRPillarConfiguration newFromDictionary: {
		#_outputFormat -> self.
	} asDictionary)
		parent: aPRProject configuration;
		yourself.

	(PRCopyPhase directory: 'support')
		configuration: configuration;
		executeOn: (PRCompilationContext new configuration: configuration; yourself).
	(PRCopyPhase directory: 'figures')
		configuration: configuration;
		executeOn: (PRCompilationContext new configuration: configuration; yourself).	
	(PRCopyPhase directory: 'Chapters/Chapter1/figures')
		configuration: configuration;
		executeOn: (PRCompilationContext new configuration: configuration; yourself).