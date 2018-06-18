building
buildOn: aPRProject 
	
	| parsedDocument transformedDocument bTester cLineHandler |
	parsedDocument := self parseInputFile: file.
	transformedDocument := self transformDocument: parsedDocument.
	bTester := PRBookTesterVisitor new.
	bTester start: transformedDocument.
	cLineHandler := PRCommandLineHandler new.
	cLineHandler stdout
		nextPutAll: 'Failed: ';
		nextPutAll: bTester failedTests size asString;
	   nextPutAll: 'Passed: ';
		nextPutAll: (bTester allTestResults size - bTester failedTests) size asString.
	bTester failedTests do: [ :each | cLineHandler stdout nextPutAll: each explanation;
																		  nextPutAll: each text;
																		  nextPutAll: '---'].
	cLineHandler quit.

