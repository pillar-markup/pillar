visiting-document
templateForConfiguration: aConfiguration
	
	^ aConfiguration propertyAt: 'epubTemplate' ifAbsent: [ '_support/templates/epub/xhtml.mustache' ]