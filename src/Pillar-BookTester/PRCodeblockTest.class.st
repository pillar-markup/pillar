Class {
	#name : #PRCodeblockTest,
	#superclass : #PRTextTest,
	#category : 'Pillar-BookTester-Visitor-Tests'
}

{ #category : #running }
PRCodeblockTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	super setUp
]

{ #category : #tests }
PRCodeblockTest >> testIsClassDefinition [

	| cb1 |
	cb1 := PRCodeblock content:'SuperClass name subclass: #ClassName
instanceVariableNames: ''''
classVariableNames: ''''
package: ''PackageName'''
						   parameters: (OrderedDictionary newFromPairs: { 'classDefinition' . true }).
	self assert: cb1 isClassDefinition.	
]

{ #category : #tests }
PRCodeblockTest >> testIsExample [

	| cb1 cb2 |
	cb1 := PRCodeblock content:'3+4
>>>7'
						   parameters:  (OrderedDictionary newFromPairs: { 'example' . true }).
	self assert: cb1 isExample.
	
	

	
]

{ #category : #tests }
PRCodeblockTest >> testIsExpectedFailure [

	| cb1 |
	cb1 := PRCodeblock content:'3+4
>>>7'
						   parameters:  (OrderedDictionary newFromPairs: { 'expectedFailure' . true }).
	self assert: cb1 isExpectedFailure.
	
	

	
]

{ #category : #tests }
PRCodeblockTest >> testIsMethodDefinition [

	| cb1 cb2 |
	cb1 := PRCodeblock content:'MethodClassName >> methodName
methodBody'
						   parameters:  (OrderedDictionary newFromPairs: { 'methodDefinition' . true }).
	self assert: cb1 isMethodDefinition.
]

{ #category : #tests }
PRCodeblockTest >> testIsTestDefinition [

	| cb1 |
	cb1 := PRCodeblock content:'TestClassName >> testMethodName
testBody'
						   parameters:  (OrderedDictionary newFromPairs: { 'testDefinition' . true }).
	self assert: cb1 isTestDefinition.
]

{ #category : #tests }
PRCodeblockTest >> testTextForExample [

	| cb |
	cb := PRCodeblock content:'3+4
>>> 7'parameters:  (OrderedDictionary newFromPairs: { 'testcase' . true }).
	self assert: cb textForExample equals: '(3+4)>>>7'
]

{ #category : #tests }
PRCodeblockTest >> testTextForMethodDefinition [

	| cb collection |
	collection := (Array with: 'PRCodeblockTestResults').
	cb  := PRCodeblock content:'PRCodeblockTestResults >> testTextForMethodDefinition
^ ''testTextForMethodDefinition'''parameters: (OrderedDictionary newFromPairs: { 'methodDefinition' . true }).
	self assert: cb textForMethodDefinition equals: (Array with: collection with: 'testTextForMethodDefinition' with: '^ ''testTextForMethodDefinition''')
]

{ #category : #tests }
PRCodeblockTest >> testTextForMethodDefinitionOnClassSide [

	| cb collection |
	collection := (Array with: 'PRCodeblockTestResults' with: 'class').
	cb  := PRCodeblock content:'PRCodeblockTestResults class>> testTextForMethodDefinition
^ ''testTextForMethodDefinition'''parameters: (OrderedDictionary newFromPairs: { 'methodDefinition' . true }).
	self assert: cb textForMethodDefinition equals: (Array with: collection with: 'testTextForMethodDefinition' with: '^ ''testTextForMethodDefinition''')
]
