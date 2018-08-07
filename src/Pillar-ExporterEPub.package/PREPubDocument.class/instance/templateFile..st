writing
templateFile: aDocument
	
	| epubTemplatePath |
	epubTemplatePath := project configuration propertyAt: 'epubTemplate' ifAbsent: [ '_support/templates/epub/xhtml.mustache' ].
	^ project baseDirectory / (aDocument propertyAt: 'epubTemplate' ifAbsent: [ epubTemplatePath ])