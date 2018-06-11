tests
testTestableCodeblock
	
	| docText doc bTester |
	docText := '[[[testable
3 + 4 
>>> 7		
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester start: doc. 
	self assert: bTester failedTests isEmpty.
	self assert: bTester validTests size equals: 1.