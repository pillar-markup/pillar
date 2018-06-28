tests
testVisitTestDefinitionCreatesMethod
	
  | docText doc bTester |
	docText := '[[[testDefinition=true
PRBookTestDummyTestDefinition >> testVisitTestDefinitionCodeblockResult
self assert: 3+4 equals: 7
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester visitCodeblockTestDefinition: doc children first. 
	self assert: (PRBookTestDummyTestDefinition methodDict includesKey: #testVisitTestDefinitionCodeblockResult)
	