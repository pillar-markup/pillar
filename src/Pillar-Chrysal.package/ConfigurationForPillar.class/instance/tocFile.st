accessing
tocFile
	"generated code"
	^ self propertyAt: #tocFile ifAbsent: [Path from: '.']