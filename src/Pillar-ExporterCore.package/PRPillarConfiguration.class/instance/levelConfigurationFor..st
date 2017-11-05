accessing
levelConfigurationFor: aHeader
	"I return a PRNumberingConfiguration corresponding for a Header."

	^ self perform: ('level' , aHeader level asString) asSymbol