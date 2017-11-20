execution
doExecute
	
	| parsingPhase taskConfiguration parsedTree |
	taskConfiguration := (PRPillarConfiguration newFromDictionary: { 
		#input -> (PRInputDocument new file: goal inputDocument file; project: project; yourself).
	} asDictionary)
		parent: goal project configuration;
		yourself.
		
	parsingPhase := PRParsingPhase withParser: PRDocument parser.
	parsingPhase configuration: taskConfiguration.
	parsedTree := parsingPhase executeOn: (PRCompilationContext withDocument: goal inputDocument file withConfiguration: taskConfiguration).
	
	^ self cacheResult: parsedTree