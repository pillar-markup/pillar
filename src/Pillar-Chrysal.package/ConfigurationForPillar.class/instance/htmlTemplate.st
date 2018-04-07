accessing
htmlTemplate
	"generated code"
	^ self propertyAt: #htmlTemplate ifAbsent: ['_support/templates/html.mustache']