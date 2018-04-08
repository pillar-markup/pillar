backward compatibility
levelConfigurationFor: aHeader
	"I return a PRNumberingConfiguration corresponding for a Header."

	^ self printer perform: ('level' , aHeader level asString) asSymbol