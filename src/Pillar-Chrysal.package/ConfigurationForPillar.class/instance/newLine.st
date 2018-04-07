accessing
newLine
	"generated code"
	^ self propertyAt: #newLine ifAbsent: [UnixPlatform new lineEnding]