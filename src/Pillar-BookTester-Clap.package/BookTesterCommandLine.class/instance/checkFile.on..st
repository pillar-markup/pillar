running
checkFile: aBookPath on: aStream

	| bTester |
	bTester := PRBookTesterVisitor new.
	bTester checkAndReportFileNamed: aBookPath.
	aStream << (aBookPath fullName).
	aStream lf.
	aStream << 'Passed: ' << ((bTester allTestResults size - bTester failedTests size) 
									  asString) ; lf.
	aStream << 'Failed: ' << (bTester failedTests size asString);lf;lf. 
	bTester failedTests do: [ :each | 
								    	aStream << (each explanation);lf.
									   aStream << (each text);lf;lf ].
	aStream << 'File tested!';lf;lf
			  