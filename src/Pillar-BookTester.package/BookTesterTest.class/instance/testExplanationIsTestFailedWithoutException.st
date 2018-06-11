tests - explanation
testExplanationIsTestFailedWithoutException
	
	| docText doc bTester |
	docText := '[[[testable
3 + 13
>>> 15		
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester start: doc. 
	self assert: bTester validTests isEmpty.
	self assert: bTester failedTests size equals: 1.
	self assert: bTester failedTests first explanation equals: 'Test failed without raising an exception'.