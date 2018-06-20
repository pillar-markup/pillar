protected
value: aValue
	
	self deprecated: 'Please use #path: instead'
		  transformWith: '`@receiver value: `@statements1' -> '`@receiver path: `@statements1'.
		
	^ self withParameters: (OrderedDictionary new
			at: 'value' put: aValue;
			yourself)