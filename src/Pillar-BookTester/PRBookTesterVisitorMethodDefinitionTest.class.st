Class {
	#name : #PRBookTesterVisitorMethodDefinitionTest,
	#superclass : #PRBookTesterVisitorTest,
	#category : 'Pillar-BookTester-Visitor-Tests'
}

{ #category : #running }
PRBookTesterVisitorMethodDefinitionTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	
	super setUp.
	PRBookTestDummyMethodDefinition methods do: [ :each | each removeFromSystem ].
	(PRBookTestDummyMethodDefinition class) methods do: [ :each | each removeFromSystem ].
	(PRBookTestDummyClass allSubclasses includes: PRBookTestDummyClassCreation)
		ifTrue: [SystemDictionary new removeClassNamed: #PRBookTestDummyClassCreation].


]

{ #category : #running }
PRBookTesterVisitorMethodDefinitionTest >> tearDown [
	"Hooks that subclasses may override to define the fixture of test."
	
	PRBookTestDummyMethodDefinition methods do: [ :each | each removeFromSystem ].
	(PRBookTestDummyMethodDefinition class) methods do: [ :each | each removeFromSystem ].
	(PRBookTestDummyClass allSubclasses includes: PRBookTestDummyClassCreation)
		ifTrue: [SystemDictionary new removeClassNamed: #PRBookTestDummyClassCreation].
]

{ #category : #'tests-class/method definition' }
PRBookTesterVisitorMethodDefinitionTest >> testVisitClassDefinitionValid [
	
  | docText doc bTester |
		
	docText := '[[[classDefinition=true
PRBookTestDummyClass subclass: #PRBookTestDummyClassCreation
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Pillar-BookTester-Visitor-Tests''
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester visitCodeblockClassDefinition: doc children first. 
	self assert: bTester failedTests isEmpty.
	self assert: bTester validTests size equals: 1.
]

{ #category : #'tests-class/method definition' }
PRBookTesterVisitorMethodDefinitionTest >> testVisitMethodDefinitionCreatesMethod [
	
  | docText doc bTester |
	docText := '[[[methodDefinition=true
PRBookTestDummyMethodDefinition >> methodTestDefinitionCreatesTest
^ ''I am a method of the class'', self class asString
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester visitCodeblockMethodDefinition: doc children first. 
	self assert: (PRBookTestDummyMethodDefinition methodDict includesKey: #methodTestDefinitionCreatesTest).
]

{ #category : #'tests-class/method definition' }
PRBookTesterVisitorMethodDefinitionTest >> testVisitMethodDefinitionFailing [
	
  | docText doc bTester |
	docText := '[[[methodDefinition=true
PRUnexistingClass >> methodTestDefinitionCreatesTest
^ ''I am a method of the class '', self class asString
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester visitCodeblockMethodDefinition: doc children first. 
	self assert: bTester failedTests size equals: 1.
	self assert: bTester validTests isEmpty.
]

{ #category : #'tests-class/method definition' }
PRBookTesterVisitorMethodDefinitionTest >> testVisitMethodDefinitionFailingWithExpectedFailure [
	
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
]

{ #category : #'tests-class/method definition' }
PRBookTesterVisitorMethodDefinitionTest >> testVisitMethodDefinitionOneBracket [
	
  | docText doc bTester |
	docText := '[[[methodDefinition=true
PRBookTestDummyMethodDefinition > methodTestDefinitionCreatesTest
^ ''I am a method of the class'', self class asString
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester visitCodeblockMethodDefinition: doc children first. 
	self assert: bTester failedTests size equals: 1.
	self assert: bTester validTests isEmpty.
]

{ #category : #'tests-class/method definition' }
PRBookTesterVisitorMethodDefinitionTest >> testVisitMethodDefinitionValid [
	
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
]

{ #category : #'tests-class/method definition' }
PRBookTesterVisitorMethodDefinitionTest >> testVisitMethodDefinitionValidClassSide [
	
  | docText doc bTester |
	docText := '[[[methodDefinition=true
PRBookTestDummyMethodDefinition class>> methodTestDefinitionCreatesTest
^ ''I am a method of the class'', self class asString
]]]
'.
	doc := PRPillarParser new parse: docText.
	bTester := PRBookTesterVisitor new.
	bTester visitCodeblockMethodDefinition: doc children first. 
	self assert: bTester failedTests isEmpty.
	self assert: bTester validTests size equals: 1.
]

{ #category : #'tests-class/method definition' }
PRBookTesterVisitorMethodDefinitionTest >> testVisitTestDefinitionCreatesMethod [
	
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
]
