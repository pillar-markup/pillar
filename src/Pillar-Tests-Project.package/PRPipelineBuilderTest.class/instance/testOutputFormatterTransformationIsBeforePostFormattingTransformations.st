order
testOutputFormatterTransformationIsBeforePostFormattingTransformations
	| builder pipeline phase |
	builder := PRPipelineBuilder new.
	phase := PRTemplatingPhase new.
	
	builder outputFormatter: PRLaTeXWriter new.
	builder addPostFormattingTransformation: phase.
	
	pipeline := builder build.
	
	self assert: pipeline pipes size equals: 2.
	self assert: (pipeline pipes before: phase) isOutputFormatterPhase