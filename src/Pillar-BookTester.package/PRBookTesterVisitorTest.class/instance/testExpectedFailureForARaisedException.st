tests - examples
testExpectedFailureForARaisedException

	| docText doc bTester |
	docText := 
'[[[example=true|expectedFailure=true
3 + ''a'' 
>>> 12		
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester start: doc. 
	self assert: bTester failedTests isEmpty.
	self assert: (bTester validTests size) equals: 1.