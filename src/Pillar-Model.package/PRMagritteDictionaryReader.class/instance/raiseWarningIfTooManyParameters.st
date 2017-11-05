action
raiseWarningIfTooManyParameters
	dictionary isEmpty
		ifFalse: [ 
			dictionary keys
				do: [ :key | PRWarning signal: key , ' is not a valid parameter for a ' , class tag , ' annotation. This will be ignore.' ] ]