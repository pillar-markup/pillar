order
testPostFormattingIsBeforeSavingRegardlessTheBuildOrder
	| builder pipeline phase |
	builder := PRPipelineBuilder new.
	phase := PRTemplatingPhase new.
	
	builder addPostFormattingTransformation: phase.
	builder save.
	
	pipeline := builder build.
	
	self assert: pipeline pipes size equals: 2.
	self assert: (pipeline pipes after: phase) isSavePhase