protocol
beSilentDuring: aBlock
	^ self 
			value: PRValidationStrategy silent
			during: aBlock