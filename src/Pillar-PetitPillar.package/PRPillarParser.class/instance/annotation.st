grammar - Annotation
annotation
	^ super annotation ==> [ :array | 
			(array third withParameters: (array fourth ifNil: [ OrderedDictionary new ]))
				start: array first start;
				stop: array sixth stop ]