accessing
outputDirectory
	"generated code"
	^ self propertyAt: #outputDirectory ifAbsent: [Path from: 'build']