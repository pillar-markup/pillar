tests
testTestableCodeblockWithFalseTest
	
	| docText doc bTester |
	docText := '[[[testable
3 + 4 
>>> 8		
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester start: doc. 
	self assert: bTester validTests isEmpty.
	self assert: bTester failedTests size equals: 1.