accessing
levelConfigurationFor: aHeader
	"to get the associated level spec"
	
	^ self perform: ('level' , aHeader level asString) asSymbol