building
buildPipe: aConfiguration
	 ^ (LPPipeline 
			pipes: (self allPipes: aConfiguration))
			pipelineClass: self;
			addAllDependencies: (self allDependencies: aConfiguration) sort