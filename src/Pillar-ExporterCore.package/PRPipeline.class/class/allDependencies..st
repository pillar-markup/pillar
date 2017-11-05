building
allDependencies: aConfiguration
	^ self dependencies
		collect: [ :each | each buildPipe: aConfiguration ]