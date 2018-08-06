writing
templateFile
	
	| epubTemplatePath |
	epubTemplatePath := project configuration propertyAt: 'epubTemplate' ifAbsent: [ '_support/templates/epub/xhtml.mustache' ].
	^ project baseDirectory / epubTemplatePath