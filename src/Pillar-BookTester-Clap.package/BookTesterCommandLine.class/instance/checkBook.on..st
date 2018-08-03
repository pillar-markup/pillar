running
checkBook: aBookPath on: aStream

	| bTester |
	bTester := PRBookTesterVisitor new.
	bTester checkAndReportFileNamed: aBookPath.
	aStream << aBookPath fullName.
			  aStream cr;lf.
			  aStream << 'Passed: ' << (bTester allTestResults size - bTester failedTests size) asString.
			  aStream cr; lf.
			  aStream << 'Failed: ' << bTester failedTests size asString.
			  aStream cr;lf;cr;lf. 
			  bTester failedTests do: [ :each | 
												aStream << each explanation.
												aStream cr;lf.
											   aStream << each text.
											   aStream cr;lf; cr;lf ].