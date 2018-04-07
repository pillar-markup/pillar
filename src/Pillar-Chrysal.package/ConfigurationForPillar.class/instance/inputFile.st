accessing
inputFile
	"generated code"
	^ self propertyAt: #inputFile ifAbsent: [(FileSystem workingDirectory / 'book')]