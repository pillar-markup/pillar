grammar - Annotation
annotation
	^ super annotation ==> [ :array | 
			(array third withParameters: (array fourth ifNil: [ PRParameters new ]))
				start: array first start;
				stop: array sixth stop ]