execution
doExecute
	
	^ transformations
		inject: self pillarDocument
		into: [ :accum :each | 
			each
				goal: goal;
				start: accum ]