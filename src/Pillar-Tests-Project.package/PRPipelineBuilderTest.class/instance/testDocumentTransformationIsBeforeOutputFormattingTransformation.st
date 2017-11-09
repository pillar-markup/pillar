order
testDocumentTransformationIsBeforeOutputFormattingTransformation
	| builder pipeline phase |
	builder := PRPipelineBuilder new.
	phase := PRTemplatingPhase new.
	
	builder addPillarDocumentTransformation: phase.
	builder outputFormatter: PRLaTeXWriter new.
	
	pipeline := builder build.
	
	self assert: pipeline pipes size equals: 2.
	self assert: (pipeline pipes after: phase) isOutputFormatterPhase