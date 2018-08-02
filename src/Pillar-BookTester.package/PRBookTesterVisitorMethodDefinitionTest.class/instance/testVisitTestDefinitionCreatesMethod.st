tests-class/method definition
testVisitTestDefinitionCreatesMethod
	
  | docText doc bTester |
	docText := '[[[testDefinition=true
PRBookTestDummyMethodDefinition >> testTestDefinitionCreatesTest
self assert: 3+4 equals: 7
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester visitCodeblockMethodDefinition: doc children first. 
	self assert: (PRBookTestDummyMethodDefinition methodDict includesKey: #testTestDefinitionCreatesTest).