"
I am a parameterizable test case. My tests can receive arguments.

>> testX: x y: y
  ...

Parameters are automatically deduced from argument names. That is, for argument #x, I search all selectors on the instance side that are prefixed by the string 'x'. For example,  on a parameter named #output I'll search all methods named  #output[Other] in the current hierarchy.

Once deduced the argument selectors from the argument names, I create a test case instance for each of the permutations of selectors.

My instances contain then:
 - the test selector to execute
 - an array with a permutation of selctors corresponding each to each argument name

My #performTest method is defined  to obtain all test arguments using the argument selectors and then perform the test selector providing those arguments.

I am not used so far because I don't work in SmalltalkCI
"
Class {
	#name : #PRParameterizableTestCase,
	#superclass : #TestCase,
	#instVars : [
		'testArguments'
	],
	#category : 'Pillar-Tests-Integration'
}

{ #category : #'building suites' }
PRParameterizableTestCase class >> buildSuiteFromMethods: testMethods [

	| testCases suite |
	testCases := testMethods flatCollect: [ :each |
		self testCasesForSelector: each ].
	suite := self suiteClass named: self name asString.
	testCases do: [ :each | suite addTest: each ].
	^ suite
]

{ #category : #testing }
PRParameterizableTestCase class >> isAbstract [

	^ self class == PRParameterizableTestCase
]

{ #category : #'building suites' }
PRParameterizableTestCase class >> permutationsOf: aCollection [ 
	
	| restOfPermutations |
	aCollection ifEmpty: [ ^ #(#()) ].
	restOfPermutations := self permutationsOf: aCollection allButFirst.
	^ aCollection first flatCollect: [ :element | 
		restOfPermutations collect: [ :permutation | permutation copyWithFirst: element  ] ]
]

{ #category : #'instance creation' }
PRParameterizableTestCase class >> selector: testSelector arguments: arguments [

	^ self new
		setTestSelector: testSelector;
		setTestArguments: arguments;
		yourself
]

{ #category : #'building suites' }
PRParameterizableTestCase class >> testCasesForSelector: testSelector [
	
	| method argumentPossibilities |
	method := self >> testSelector.
	argumentPossibilities := method argumentNames collect: [ :each |
		self allSelectors select: [ :selector | selector beginsWith: each ]  ].
	
	^ (self permutationsOf: argumentPossibilities)
			collect: [ :permutation | 
				self selector: testSelector arguments: permutation ]
]

{ #category : #'building suites' }
PRParameterizableTestCase class >> testSelectors [
	^ self selectors select: [ :each | (each beginsWith: 'test') ]
]

{ #category : #'private-parameterizable' }
PRParameterizableTestCase >> cleanUpInstanceVariables [
	| instVarsToKeep |
	instVarsToKeep := #( 'testSelector' 'testArguments' ).
	self class allInstVarNames do: [ :name |
		(instVarsToKeep includes: name) ifFalse: [
			self instVarNamed: name put: nil ] ]
]

{ #category : #'private-parameterizable' }
PRParameterizableTestCase >> performTest [

	^ self
		perform: testSelector asSymbol
		withArguments: (testArguments collect: [ :each | self perform: each ])
]

{ #category : #'private-parameterizable' }
PRParameterizableTestCase >> printOn: aStream [
	super printOn: aStream.
	testArguments printOn: aStream.
]

{ #category : #'private-parameterizable' }
PRParameterizableTestCase >> setTestArguments: aCollection [ 
	
	testArguments := aCollection
]
