building
allPipes: aConfiguration
	^ (self allPipeClasses: aConfiguration)
		collect: [ :each | each buildPipe: aConfiguration ]