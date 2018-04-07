accessing
baseDirectory
	"generated code"
	^ self propertyAt: #baseDirectory ifAbsent: [(FileSystem workingDirectory / '.')]