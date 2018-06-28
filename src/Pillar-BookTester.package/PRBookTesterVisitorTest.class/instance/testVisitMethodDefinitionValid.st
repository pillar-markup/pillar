tests
testVisitMethodDefinitionValid
	
  | docText doc bTester |
	docText := '[[[methodDefinition=true
PRBookTestDummyMethodDefinition >> methodTestDefinitionCreatesTest
^ ''I am a method of the class'', self class asString
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester visitCodeblockMethodDefinition: doc children first. 
	self assert: bTester failedTests isEmpty.
	self assert: bTester validTests size equals: 1.