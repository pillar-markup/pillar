execution
doExecute
	
	| parsingPhase taskConfiguration parsedTree |
	taskConfiguration := (PRPillarConfiguration newFromDictionary: { 
		#input -> (PRInputDocument new file: inputFile; project: project; yourself).
	} asDictionary)
		parent: project configuration;
		yourself.
		
	parsingPhase := PRParsingPhase withParser: PRDocument parser.
	parsingPhase configuration: taskConfiguration.
	parsedTree := parsingPhase executeOn: (PRCompilationContext withDocument: inputFile withConfiguration: taskConfiguration).
	
	^ self cacheResult: parsedTree