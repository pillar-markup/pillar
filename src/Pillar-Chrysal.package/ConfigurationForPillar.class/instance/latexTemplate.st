accessing
latexTemplate
	"generated code"
	^ self propertyAt: #latexTemplate ifAbsent: ['_support/templates/main.latex.mustache']