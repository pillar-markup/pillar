accessing
relativeSimple
	"generated code"
	^ self propertyAt: #relativeSimple ifAbsent: [Path from: 'simple']