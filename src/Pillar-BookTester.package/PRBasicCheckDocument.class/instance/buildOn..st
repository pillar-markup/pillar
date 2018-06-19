building
buildOn: aPRProject 
	
	| parsedDocument transformedDocument bTester |
	self halt.
	parsedDocument := self parseInputFile: file.
	transformedDocument := self transformDocument: parsedDocument.
	bTester := PRBookTesterVisitor new.
	bTester start: transformedDocument.
	Stdio stdout crlf;
		nextPutAll: file fullName;crlf.
	
	Stdio stdout
		nextPutAll: 'Passed: ';
		nextPutAll: (bTester allTestResults size - bTester failedTests size) asString; crlf; 
		nextPutAll: 'Failed: ';
		nextPutAll: bTester failedTests size asString; crlf;crlf.

	bTester failedTests do: [ :each | Stdio stdout nextPutAll: each explanation; crlf;
															    nextPutAll: each text; crlf; crlf ].

