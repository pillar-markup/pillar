accessing
buildOn: aPRProject 
	
	| parsedDocument transformedDocument testGen |
	parsedDocument := self parseInputFile: file.
	transformedDocument := self transformDocument: parsedDocument.
	testGen := PRBookTestGenerator new.
	testGen start: transformedDocument.
	Stdio stdout crlf;
		nextPutAll: file fullName;crlf;
		nextPutAll: 'Tests created under the package ''Pillar-BookTesterResults'' with the name of the file'.
	