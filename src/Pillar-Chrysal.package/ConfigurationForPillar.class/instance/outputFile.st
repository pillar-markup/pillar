accessing
outputFile
	"generated code"
	^ self propertyAt: #outputFile ifAbsent: [(FileSystem workingDirectory / 'output')]