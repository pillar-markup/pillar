initialization
validateInclusionOfFile: aSource
	
	self documentSource = aSource ifTrue: [ 
		PRCyclicFileInclusionError new
			files: { aSource };
			signal
	].

	(inProcessFiles includes: aSource)
		ifTrue: [ PRCyclicFileInclusionError new
			files: (inProcessFiles copyWith: aSource);
			signal 
	]