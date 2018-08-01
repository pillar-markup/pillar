writing
templateFile: aDocument
	
	^ project baseDirectory / (aDocument propertyAt: 'htmlTemplate' ifAbsent: [self writer templateForConfiguration: project configuration])