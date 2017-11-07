templating
templateForFile: aFileReference usingWriter: aWriter
	
	^ aWriter templateNameForFile: aFileReference inConfiguration: self configuration.