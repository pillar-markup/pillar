tests
testVisitMethodDefinitionCreatesMethod
	
  | docText doc bTester |
	docText := '[[[methodDefinition=true
PRBookTestDummyMethodDefinition >> methodTestDefinitionCreatesTest
^ ''I am a method of the class'', self class asString
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester visitCodeblockMethodDefinition: doc children first. 
	self assert: (PRBookTestDummyMethodDefinition methodDict includesKey: #methodTestDefinitionCreatesTest)