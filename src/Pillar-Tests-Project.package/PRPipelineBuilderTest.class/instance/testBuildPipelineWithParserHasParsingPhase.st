tests
testBuildPipelineWithParserHasParsingPhase
	| builder pipeline |
	builder := PRPipelineBuilder new.
	builder parser: PRDocument parser.
	pipeline := builder build.
	self assert: pipeline pipes size equals: 2.
	self assert: pipeline pipes first isParsingPhase.
	self assert: pipeline pipes second isFileInclusionPhase.