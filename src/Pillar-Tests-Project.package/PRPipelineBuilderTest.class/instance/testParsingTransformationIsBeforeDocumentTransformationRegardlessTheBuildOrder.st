order
testParsingTransformationIsBeforeDocumentTransformationRegardlessTheBuildOrder
	| builder pipeline phase inclusionPhase |
	builder := PRPipelineBuilder new.
	phase := PRTemplatingPhase new.
	
	"Set the pillar document transformation before the parser"
	builder addPillarDocumentTransformation: phase.
	builder parser: PRDocument parser.
	
	pipeline := builder build.
	
	self assert: pipeline pipes size equals: 3.
	self assert: (inclusionPhase := pipeline pipes before: phase) isFileInclusionPhase.
	self assert: (pipeline pipes before: inclusionPhase) isParsingPhase