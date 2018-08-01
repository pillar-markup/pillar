writing
templateFile: aDocument
	
	^ project baseDirectory / (aDocument propertyAt: 'template' ifAbsent: [self writer templateForConfiguration: project configuration])