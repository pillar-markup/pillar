visiting-document
visitHeader: aHeader
	
	"this is done like that because the txt can be wrapped into bold and other"
	headerCapitalization := (self configuration printer levelConfigurationFor: aHeader) capitalization.
	super visitHeader: aHeader 