protected
path: aPath
	
	^ self withParameters: (OrderedDictionary new
			at: 'path' put: aPath;
			yourself)