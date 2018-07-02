tests
testVisitTestDefinitionValid
	
  | docText doc bTester |
	docText := '[[[testDefinition=true
PRBookTestDummyMethodDefinition >> testTestDefinitionCreatesTest
self assert: 3+4 equals: 7
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester visitCodeblockMethodDefinition: doc children first. 
	self assert: bTester failedTests isEmpty.
	self assert: bTester validTests size equals: 1.