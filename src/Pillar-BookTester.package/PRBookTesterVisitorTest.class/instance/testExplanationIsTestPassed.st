tests - explanation
testExplanationIsTestPassed
	
	| docText doc bTester |
	docText := '[[[testcase=true
3 + 12
>>> 15		
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester start: doc. 
	self assert: bTester validTests size equals: 1.
	self assert: bTester failedTests isEmpty.
	self assert: bTester validTests first explanation equals: 'Test passed'.