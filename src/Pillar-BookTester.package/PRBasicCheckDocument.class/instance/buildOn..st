building
buildOn: aPRProject 
	
	| parsedDocument transformedDocument bTester stream |
	parsedDocument := self parseInputFile: file.
	transformedDocument := self transformDocument: parsedDocument.
	bTester := PRBookTesterVisitor new.
	bTester start: transformedDocument.
	stream := String streamContents: 
				 [ :s |
					s << file fullName.
					s crlf.
					s << 'Passed: ' << (bTester allTestResults size - bTester failedTests size) asString.
					s crlf.
					s << 'Failed: ' << bTester failedTests size asString.
					s crlf;crlf. ].
		"(Stdio stdout crlf;
				nextPutAll: file fullName;crlf)."
		"(Stdio stdout
			nextPutAll: 'Passed: ';
			nextPutAll: (bTester allTestResults size - bTester failedTests size) asString; crlf; 
			nextPutAll: 'Failed: ';
			nextPutAll: bTester failedTests size asString; crlf;crlf)."

	bTester failedTests do: [ :each | stream streamContents: [:s|
												s << each explanation.
												s crlf.
											   s << each text.
											   s crlf; crlf ]. ].
	Stdio stdout 
		nextPutAll: stream.
