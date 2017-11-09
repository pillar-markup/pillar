order
testParsingTransformationIsBeforeDocumentTransformation
	| builder pipeline phase inclusionPhase |
	builder := PRPipelineBuilder new.
	phase := PRTemplatingPhase new.
	
	builder parser: PRDocument parser.
	builder addPillarDocumentTransformation: phase.
	
	pipeline := builder build.
	
	self assert: pipeline pipes size equals: 3.
	self assert: (inclusionPhase := pipeline pipes before: phase) isFileInclusionPhase.
	self assert: (pipeline pipes before: inclusionPhase) isParsingPhase