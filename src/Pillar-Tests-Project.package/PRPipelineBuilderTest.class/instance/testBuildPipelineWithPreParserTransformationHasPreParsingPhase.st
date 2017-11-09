tests
testBuildPipelineWithPreParserTransformationHasPreParsingPhase
	| builder pipeline phase |
	builder := PRPipelineBuilder new.
	phase := PRTemplatingPhase new.
	builder addPreParsingTransformation: phase.
	pipeline := builder build.
	self assert: pipeline pipes size equals: 1.
	self assert: pipeline pipes first equals: phase