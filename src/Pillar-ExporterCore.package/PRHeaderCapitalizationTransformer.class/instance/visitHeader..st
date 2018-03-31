visiting-document
visitHeader: aHeader
	
	headerCapitalization := (self configuration levelConfigurationFor: aHeader) capitalization.
	super visitHeader: aHeader 