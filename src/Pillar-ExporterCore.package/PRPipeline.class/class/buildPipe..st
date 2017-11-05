building
buildPipe: aConfiguration
	 ^ (LPPipeline pipes: (self allPipes: aConfiguration))
		addAllDependencies: (self allDependencies: aConfiguration) sort