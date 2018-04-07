accessing
levels
	"generated code"
	^ self propertyAt: #levels ifAbsent: [ OrderedCollection new ]