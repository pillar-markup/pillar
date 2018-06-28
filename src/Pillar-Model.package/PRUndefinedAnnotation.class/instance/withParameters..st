initialization
withParameters: aPRParameters 
	self add: aPRParameters.
	self parameters: (PRParametersToOrderedDictionary of: aPRParameters).