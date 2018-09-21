accessing
absoluteSimple
	"generated code"
	^ self propertyAt: #absoluteSimple ifAbsent: [Path from: '/simple']