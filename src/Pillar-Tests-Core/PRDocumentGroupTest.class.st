Class {
	#name : #PRDocumentGroupTest,
	#superclass : #PRDocumentItemTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRDocumentGroupTest class >> isAbstract [
	^ true
]

{ #category : #private }
PRDocumentGroupTest >> actualClass [
	^ PRDocumentGroup
]

{ #category : #'tests-adding' }
PRDocumentGroupTest >> testAdd [
	self instance add: self fooInstance.
	self assert: self instance children size = 1.
	self assert: self instance children first = self fooInstance.

	self instance add: self barInstance.
	self assert: self instance children size = 2.
	self assert: self instance children first = self fooInstance.
	self assert: self instance children second = self barInstance
]

{ #category : #'tests-adding' }
PRDocumentGroupTest >> testAddAll [
	self instance addAll: self foobarInstances.
	self assert: self instance children size = 2.
	self assert: self instance children first = self fooInstance.
	self assert: self instance children second = self barInstance
]

{ #category : #'tests-copying' }
PRDocumentGroupTest >> testCopyChildren [
	self instance addAll: self foobarInstances.
	self assert: self instance children = self instance copy children.
	self deny: self instance children == self instance copy children.
	self instance children
		with: self instance copy children
		do: [ :a :b | self assert: a = b. self deny: a == b ]
]

{ #category : #'tests-testing' }
PRDocumentGroupTest >> testHasChildren [
	self deny: self instance hasChildren.
	self instance add: self fooInstance.
	self assert: self instance hasChildren
]

{ #category : #'tests-accessing' }
PRDocumentGroupTest >> testSize [
	self assert: self instance size = 0.
	self instance add: self fooInstance.
	self assert: self instance size = 1
]

{ #category : #'tests-accessing' }
PRDocumentGroupTest >> testText [
	self instance addAll: self foobarInstances.
	self assert: self instance text = 'foobar'
]

{ #category : #'tests-instantiation' }
PRDocumentGroupTest >> testWith [
	instance := self actualClass with: self fooInstance.
	self assert: instance children size = 1.
	self assert: instance children first = self fooInstance
]

{ #category : #'tests-instantiation' }
PRDocumentGroupTest >> testWithAll [
	instance := self actualClass withAll: self foobarInstances.
	self assert: instance children size = 2.
	self assert: instance children first = self fooInstance.
	self assert: instance children second = self barInstance
]
