running
checkBook: aBook on: aStream

	| bTester |
	bTester := PRBookTesterVisitor new.
	bTester start: aBook.
	aStream streamContents: 
				 [ :s |
					s << aBook fullName.
					s crlf.
					s << 'Passed: ' << (bTester allTestResults size - bTester failedTests size) asString.
					s crlf.
					s << 'Failed: ' << bTester failedTests size asString.
					s crlf;crlf. 
			bTester failedTests do: [ :each | 
												s << each explanation.
												s crlf.
											   s << each text.
											   s crlf; crlf ]].