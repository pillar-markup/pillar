accessing
latexWriter
	"generated code"
	^ self propertyAt: #latexWriter ifAbsent: ['latex:sbabook']