tests - examples
testExampleCodeblockWithNoBrakets
	
	| docText doc bTester |
	docText := '[[[example=true
3 + 12	
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester start: doc.
	self assert: bTester validTests isEmpty.
	self assert: bTester failedTests size equals: 1.