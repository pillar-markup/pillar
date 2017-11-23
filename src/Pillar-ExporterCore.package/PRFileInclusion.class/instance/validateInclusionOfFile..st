validation
validateInclusionOfFile: aFileReference 
	
	aFileReference = topFile ifTrue: [ 
		PRCyclicFileInclusionError new
			files: { topFile };
			signal
	].

	(inProcessFiles includes: aFileReference)
		ifTrue: [ PRCyclicFileInclusionError new
			files: (inProcessFiles copyWith: aFileReference);
			signal  ]