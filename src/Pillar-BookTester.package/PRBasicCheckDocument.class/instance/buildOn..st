building
buildOn: aPRProject 
	
	| parsedDocument transformedDocument writtenFile |
	parsedDocument := self parseInputFile: file.
	transformedDocument := self transformDocument: parsedDocument.
	1halt