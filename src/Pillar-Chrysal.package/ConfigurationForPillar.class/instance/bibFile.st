accessing
bibFile
	"generated code"
	^ self propertyAt: #bibFile ifAbsent: [Path from: 'book.bib']