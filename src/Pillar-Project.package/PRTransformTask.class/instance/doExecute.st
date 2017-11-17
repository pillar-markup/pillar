execution
doExecute
	
	^ self cacheResult: (transformations
		inject: pillarDocument execute
		into: [ :accum :each | each executeOn: accum ])