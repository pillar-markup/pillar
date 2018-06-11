tests
testTestableCodeblockWithTwoBrackets
	
	| docText doc bTester |
	docText := '[[[testable
3 + 12
>> 15
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester start: doc.
	self assert: bTester validTests isEmpty.
	self assert: bTester failedTests size equals: 1.