visiting-document
visitHeader: aGroup

	headerCapitalization := (self configuration levelConfigurationFor: aGroup) capitalization.
	super visitHeader: aGroup.