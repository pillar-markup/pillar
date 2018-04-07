accessing
outputDirectory
	"generated code"
	^ self propertyAt: #outputDirectory ifAbsent: [(FileSystem workingDirectory / 'build')]