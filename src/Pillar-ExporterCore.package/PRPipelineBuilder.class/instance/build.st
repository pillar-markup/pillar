building
build

	| pipeline |
	pipeline := PRParseTask new
		inputStreamDependency: (PRGenericObjectTask result: inputDocument readStream binary).

	pipeline := PRExpandInclusionsTask new
		inputFile: goal inputDocument file;
		pillarDocumentDependency: pipeline.
	
	pipeline := PRTransformTask new
		transformations: (LPPipeline pipes: self pillarDocumentTransformations) sort pipes;
		pillarDocumentDependency: pipeline.
		
	pipeline := PROutputFormatterTask new
		pillarDocumentDependency: pipeline;
		writer: (goal target writerFor: goal project configuration).
	
	pipeline := self postFormattingTransformations
		inject: pipeline
		into: [ :accum :task | 
			task
				formattedDocumentDependency: accum;
				yourself ].
	
	save ifTrue: [ 
		pipeline := PRSaveTask new
			outputDocumentDependency: pipeline;
			outputFile: goal outputFile ].

	^ self postSaveTransformations
		inject: pipeline
		into: [ :accum :task | 
			task inputFileDependency: accum ]