writing
templateFile
	
	| epubTemplatePath |
	epubTemplatePath := project configuration propertyAt: 'epubTemplate' ifAbsent: [ '_support/templates/xhtml.mustache' ].
	^ project baseDirectory / epubTemplatePath