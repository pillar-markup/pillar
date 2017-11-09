order
testPreParsingTransformationIsBeforeParsingTransformation
	| builder pipeline phase parsingPhase |
	builder := PRPipelineBuilder new.
	phase := PRTemplatingPhase new.
	
	builder addPreParsingTransformation: phase.
	builder parser: PRDocument parser.
	
	pipeline := builder build.
	
	self assert: pipeline pipes size equals: 3.
	self assert: (parsingPhase := pipeline pipes after: phase) isParsingPhase.
	self assert: (pipeline pipes after: parsingPhase) isFileInclusionPhase.