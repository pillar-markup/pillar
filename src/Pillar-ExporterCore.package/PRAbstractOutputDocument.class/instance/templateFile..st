templating
templateFile: aDocument

	^ self templateDirectory
		/ (aDocument propertyAt: 'template' ifAbsent: [ self writer templateForConfiguration: project configuration ])