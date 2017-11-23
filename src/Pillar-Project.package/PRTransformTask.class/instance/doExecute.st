execution
doExecute
	
	^ transformations
		inject: self pillarDocument
		into: [ :accum :each | 
			each start: accum ]