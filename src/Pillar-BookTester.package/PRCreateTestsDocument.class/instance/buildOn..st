accessing
buildOn: aPRProject 
	
	| parsedDocument transformedDocument testGen |
	testGen := PRBookTestGenerator new.
	testGen fileName: (testGen prettyRename: file file).
	testGen createClassFrom: testGen fileName.
	parsedDocument := self parseInputFile: file.
	transformedDocument := self transformDocument: parsedDocument.
	testGen start: transformedDocument.
	Stdio stdout crlf; crlf;
		nextPutAll: file fullName;crlf;
		nextPutAll: 'Tests created under the package ''Pillar-BookTesterResults'' with the name of the file'; crlf.
	