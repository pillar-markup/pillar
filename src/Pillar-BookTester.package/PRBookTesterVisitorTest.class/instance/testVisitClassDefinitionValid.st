tests
testVisitClassDefinitionValid
	
  | docText doc bTester |
	docText := '[[[classDefinition=true
Object subclass: #PRBookTesterVisitorMethodDefinitionTest
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Pillar-BookTesterResults''
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester visitCodeblockClassDefinition: doc children first. 
	self assert: bTester failedTests isEmpty.
	self assert: bTester validTests size equals: 1.