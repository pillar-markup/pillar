order
testPreParsingTransformationIsBeforeParsingTransformationRegardlesTheBuildOrder
	| builder pipeline phase parsingPhase |
	builder := PRPipelineBuilder new.
	phase := PRTemplatingPhase new.
	
	"Set the parser before the pre-parsing transformation"
	builder parser: PRDocument parser.
	builder addPreParsingTransformation: phase.
	
	pipeline := builder build.
	
	self assert: pipeline pipes size equals: 3.
	self assert: (parsingPhase := pipeline pipes after: phase) isParsingPhase.
	self assert: (pipeline pipes after: parsingPhase) isFileInclusionPhase.