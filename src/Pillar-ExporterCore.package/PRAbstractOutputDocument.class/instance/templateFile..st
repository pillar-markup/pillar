writing
templateFile: aDocument
	
	^ project baseDirectory / ('_support/templates/', self writer class writerName, '/', (aDocument propertyAt: 'template' ifAbsent: [self writer templateForConfiguration: project configuration]))