visiting-document
templateForConfiguration: aConfiguration
	
	^ aConfiguration propertyAt: 'epubTemplate' ifAbsent: [ '_support/templates/xhtml.mustache' ]