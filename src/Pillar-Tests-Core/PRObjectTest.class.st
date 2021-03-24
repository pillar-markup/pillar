"
Tests for expectations that must be valid on all pillar objects
"
Class {
	#name : #PRObjectTest,
	#superclass : #PRBasicObjectTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #'tests-copying' }
PRObjectTest >> testCopyProperties [
	self deny: self instance properties identicalTo: self instance copy properties
]

{ #category : #'tests-properties' }
PRObjectTest >> testHasProperty [
	self deny: (self instance hasProperty: #foo).
	self instance propertyAt: #foo put: 'bar'.
	self assert: (self instance hasProperty: #foo).
	self deny: (self instance hasProperty: #bar)
]

{ #category : #'tests-properties' }
PRObjectTest >> testProperties [
	self assert: self instance properties isNotNil.
	self instance instVarNamed: 'properties' put: nil.

	self instance propertyAt: #foo put: #bar.
	self instance instVarNamed: 'properties' put: nil.

	self instance propertyAt: #foo ifAbsent: [ nil ].
	self instance instVarNamed: 'properties' put: nil.

	self instance propertyAt: #foo ifAbsentPut: [ #bar ].
	self instance instVarNamed: 'properties' put: nil.

	self instance hasProperty: #foo.
	self instance instVarNamed: 'properties' put: nil
]

{ #category : #'tests-properties' }
PRObjectTest >> testPropertyAt [
	self assert: (self instance propertyAt: #foo put: 'bar') equals: 'bar'.
	self assert: (self instance propertyAt: #foo) equals: 'bar'.
	self should: [ self instance propertyAt: #bar ] raise: PRPropertyError
]

{ #category : #'tests-properties' }
PRObjectTest >> testPropertyAtIfAbsent [
	self assert: (self instance propertyAt: #foo put: 'bar') equals: 'bar'.
	self assert: (self instance propertyAt: #foo ifAbsent: [ 'baz' ]) equals: 'bar'.
	self assert: (self instance propertyAt: #bar ifAbsent: [ 'baz' ]) equals: 'baz'
]

{ #category : #'tests-properties' }
PRObjectTest >> testPropertyAtIfAbsentPut [
	self assert: (self instance propertyAt: #foo put: 'bar') equals: 'bar'.
	self assert: (self instance propertyAt: #foo ifAbsentPut: [ 'baz' ]) equals: 'bar'.
	self assert: (self instance propertyAt: #foo) equals: 'bar'.

	self assert: (self instance propertyAt: #bar ifAbsentPut: [ 'baz' ]) equals: 'baz'.
	self assert: (self instance propertyAt: #bar) equals: 'baz'
]

{ #category : #'tests-properties' }
PRObjectTest >> testPropertyAtPut [
	self instance propertyAt: #foo put: 'bar'.
	self assert: (self instance propertyAt: #foo) equals: 'bar'.

	self instance propertyAt: #foo put: 'baz'.
	self assert: (self instance propertyAt: #foo) equals: 'baz'
]

{ #category : #tests }
PRObjectTest >> testSanity [
	"If this test case fails, there is something wrong with the setup of the test-case."

	self
		assert: self actualClass isAbstract not
		description: 'Unable to test abstract class.'.
	self
		assert: self instance class = self actualClass
		description: 'Invalid test instance.'
]
