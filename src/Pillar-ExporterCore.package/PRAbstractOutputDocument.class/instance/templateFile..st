writing
templateFile: aDocument

	^ project baseDirectory / ('_support/templates/', self writer class folderName, '/', (aDocument propertyAt: 'template' ifAbsent: [self writer templateForConfiguration: project configuration]))