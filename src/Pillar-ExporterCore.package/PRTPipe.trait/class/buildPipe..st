building
buildPipe: aConfiguration
	^ (LPPhase block: [ :input | self executeOn: input ])
		addAllDependencies: (self dependencies collect: [ :each | each buildPipe: aConfiguration ])