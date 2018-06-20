accessing
value
	self deprecated: 'Please use #path instead'
		  transformWith: '`@receiver value' 
						  -> '`@receiver path'.
	^ self path.