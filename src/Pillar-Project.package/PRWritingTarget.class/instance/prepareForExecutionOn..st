preparation
prepareForExecutionOn: aPRProject 

	| configuration outputDirectory |
	configuration := (PRPillarConfiguration newFromDictionary: {
		#_outputFormat -> self.
	} asDictionary)
		parent: aPRProject configuration;
		yourself.
	
	(PRCopyPhase directory: '_support')
		configuration: configuration;
		executeOn: (PRCompilationContext new configuration: configuration; yourself).

	outputDirectory := configuration outputDirectory / self outputDirectoryName.
	configuration baseDirectory children do: [ :each |
		((each basename beginsWith: '_') or: [ each basename beginsWith: '.' ]) ifFalse: [ 
			each copyAllTo: outputDirectory / each basename ] ].