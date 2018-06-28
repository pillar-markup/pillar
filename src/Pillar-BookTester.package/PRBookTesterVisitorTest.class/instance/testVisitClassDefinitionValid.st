tests
testVisitClassDefinitionValid
	
  | docText doc bTester |
	docText := '[[[classDefinition=true
PRBookTestDummyClass subclass: #PRBookTestDummyClassCreation
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Pillar-BookTester-Tests''
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester visitCodeblockClassDefinition: doc children first. 
	self assert: bTester failedTests isEmpty.
	self assert: bTester validTests size equals: 1.