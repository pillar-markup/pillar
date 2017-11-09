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

	configuration baseDirectory allChildren do: [ :each |
		(each isDirectory and: [ each basename = 'figures' ])
			ifTrue: [ 
				(PRCopyPhase directory: (each relativeTo: configuration baseDirectory) pillarPrintString)
					configuration: configuration;
					executeOn: (PRCompilationContext new configuration: configuration; yourself).
				] ].