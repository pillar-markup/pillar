visiting-document
visitHeader: aHeader

	headerCapitalization := (self printer levelConfigurationFor: aHeader) capitalization.
	super visitHeader: aHeader.