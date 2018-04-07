accessing
htmlChapterTemplate
	"generated code"
	^ self propertyAt: #htmlChapterTemplate ifAbsent: ['_support/templates/html.mustache']