tests-class/method definition
testVisitMethodDefinitionFailingWithExpectedFailure
	
  | docText doc bTester |
	docText := '[[[methodDefinition=true|expectedFailure=true
PRUnexistingClass >> methodTestDefinitionCreatesTest
^ ''I am a method of the class '', self class asString
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester visitCodeblockMethodDefinition: doc children first. 
	self assert: bTester failedTests isEmpty.
	self assert: bTester validTests size equals: 1.