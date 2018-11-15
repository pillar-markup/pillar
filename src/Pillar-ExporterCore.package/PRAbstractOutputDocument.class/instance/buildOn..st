building
buildOn: aPRProject 
	
	| parsedDocument transformedDocument writtenFile |
	parsedDocument := self parseInputFile: file.
	parsedDocument properties: (self metadataConfigurationForDocument: parsedDocument).
	transformedDocument := self transformDocument: parsedDocument.
	writtenFile := self writeDocument: transformedDocument.
	self postWriteTransform: writtenFile.
	^ PRSuccess new.