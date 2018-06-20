protected
value: aValue
	
	self deprecated: 'Please use #path: instead'
		  transformWith: '`@receiver value: `@statements1' 
						 -> '`@receiver path: `@statements1'.
	^ self path: aValue