building
build

	| pipeline |
	pipeline := PRParseTask new
		inputStreamDependency: (PRGenericObjectTask result: inputDocument readStream binary);
		goal: goal.

	pipeline := PRExpandInclusionsTask new
		pillarDocumentDependency: pipeline;
		goal: goal.
	
	pipeline := PRTransformTask new
		transformations: (LPPipeline pipes: self pillarDocumentTransformations) sort pipes;
		pillarDocumentDependency: pipeline;
		goal: goal.
		
	pipeline := PROutputFormatterTask new
		pillarDocumentDependency: pipeline;
		writer: (goal target writerFor: goal project configuration);
		goal: goal.
	
	pipeline := self postFormattingTransformations
		inject: pipeline
		into: [ :accum :task | 
			task
				goal: goal;
				formattedDocumentDependency: accum;
				yourself ].
	
	save ifTrue: [ 
		pipeline := PRSaveTask new
			outputDocumentDependency: pipeline;
			outputFile: goal outputFile ].

	^ self postSaveTransformations
		inject: pipeline
		into: [ :accum :task | 
			task 
				goal: goal;
				inputFileDependency: accum ]